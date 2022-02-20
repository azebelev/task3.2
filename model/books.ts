import { MyQuery, db } from '../database/mysql';
import { ResultSetHeader, RowDataPacket, OkPacket } from 'mysql2';
import dotenv from 'dotenv';
import { Pagination } from './pagination';
dotenv.config();


class Books {

	static async update(request: string, id: number) {
		const query = `UPDATE books SET ${request} = ${request} + 1 WHERE id = (?);`
		await MyQuery(query, [id])
	}
	static async findOne(id: string) {
		const query = `SELECT l.id, name, img, year, size, descr, clicks,visits, deleted, group_concat(concat(' ', author)) AS authors FROM books AS l 
                   JOIN books_authors AS b ON(l.id = b.book_id) 
                   JOIN authors AS a ON(b.author_id = a.id)
									 WHERE l.id = (?)
                   GROUP BY l.id`
		const values = id
		const books = await MyQuery<RowDataPacket[]>(query, values)

		return books[0] as Book
	}

	static async deleteRecover(id: number) {

		const query = "UPDATE books SET deleted = (if(deleted = true,false,true)) WHERE id = (?);"
		const report = await MyQuery<OkPacket>(query, [id]).catch(e => console.log(e))

		return report
	}

	static async addNew(book: Book) {

		const authors: Array<string> = [];
		if (book.author1?.trim() !== '') authors.push(book.author1!);
		if (book.author2?.trim() !== '') authors.push(book.author2!);
		if (book.author3?.trim() !== '') authors.push(book.author3!);
		authors.forEach(async a => {
			const query_authors = "INSERT INTO authors(author) VALUES (?)";
			await MyQuery<OkPacket>(query_authors, [a]).catch(() => console.log('try to add already exists author'));
		})
		const author_ids = await MyQuery<RowDataPacket[]>("SELECT id from authors WHERE author IN (?)", [authors]);
		console.log('author_ids', author_ids)
		const book_values = [book.name, book.img, book.year, book.size, book.descr];
		const query_books = "INSERT INTO books(name,img,year,size,descr) VALUES (?,?,?,?,?)";
		const book_id = (await MyQuery<ResultSetHeader>(query_books, book_values)).insertId;
		author_ids.forEach(async author_id => {
			const query_link = "INSERT INTO books_authors(book_id,author_id) VALUES(?,?)";
			const link_values = [book_id, author_id.id];
			await MyQuery<OkPacket>(query_link, link_values);
		})
	}

	static async findNext(pagination: Pagination) {
		const query = `SELECT l.id, name, img, year, size, descr, clicks,deleted, group_concat(concat(' ', author)) AS authors FROM books AS l 
                   JOIN books_authors AS b ON(l.id = b.book_id) 
                   JOIN authors AS a ON(b.author_id = a.id)
                   GROUP BY l.id
                   LIMIT ? OFFSET ?;
									 SELECT id from books
									 LIMIT ? OFFSET ?;`
		// we look ahead according to max_pagination_length, this variable shows 
		//us maximum number of pages depicted at pagination if we will get more then prescribed limit and
		// if this number more then '1' then it is not last page
		const limit = +process.env.BOOKS_BY_PAGE!
		const max_pagination_length = +process.env.MAX_PAGINATION_LENGTH!
		const values = [limit, pagination.offset, limit * (max_pagination_length + 1), pagination.offset];
		const sqlRespond = await MyQuery<RowDataPacket[][]>(query, values);
		const availablePages = Math.ceil(sqlRespond[1].length / limit)
		pagination.refresh(availablePages, max_pagination_length)

		return sqlRespond[0] as Book[]
	}

	static async search(searchParam: string) {

		const query = `SELECT l.id, name, img, year, size, descr, clicks, deleted, group_concat(concat(' ', author)) AS authors FROM books AS l 
                   JOIN books_authors AS b ON(l.id = b.book_id) 
                   JOIN authors AS a ON(b.author_id = a.id)
                   GROUP BY l.id 
				           having  group_concat(concat(' ', author)) like (?)
                   UNION SELECT l.id, name, img, year, size, descr, clicks, deleted, group_concat(concat(' ', author)) AS authors FROM books AS l 
                   JOIN books_authors AS b ON(l.id = b.book_id) 
                   JOIN authors AS a ON(b.author_id = a.id)
                   WHERE name like (?) or size = (?)  or year = (?)
                   GROUP BY l.id `

		const values = [`%${searchParam}%`, `%${searchParam}%`, `${searchParam}`, `${searchParam}`]
		const result = await MyQuery(query, values).catch((error) => console.log('error query search', error))

		return result as Book[]
	}
}


export { Books }
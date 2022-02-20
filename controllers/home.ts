import { Response, Request } from 'express'
import { Books } from '../model/books'
import { Pagination } from '../model/pagination'
import dotenv from 'dotenv'
dotenv.config()
const offset_step = Number(process.env.BOOKS_BY_PAGE)
let paginationRequired = false;

export async function home(req: Request, res: Response) {
	try {
		const body = (req.auth?.user === 'admin') ? 'admin' : 'books'

		const pagination = new Pagination(offset_step)
		pagination.refreshOffset(req)

		const books = await Books.findNext(pagination)

		if (pagination.required === true) paginationRequired = true
		pagination.required = paginationRequired

		res.render(body, {
			pagination,
			title: 'библиотека ',
			books,
			csrfToken: req.csrfToken()
		})
	} catch (error) {
		console.log('error at home', error)
	}
}
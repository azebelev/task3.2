import { Books } from '../model/books';
import { Request, Response } from 'express';


export async function search(req: Request, res: Response) {
	try {
		const body = (req.auth?.user === 'admin') ? 'admin' : 'books'

		if (String(req.query.searchParam).trim() !== '') {
			const books = await Books.search(String(req.query.searchParam))
			const search = { search: true, searchParam: req.query.searchParam }
			res.status(302).render(body, {
				title: 'библиотека',
				pagination: { pageNumber: 1 },
				search,
				books,
				csrfToken: req.csrfToken()
			})
		} else res.redirect('/')
	} catch (error) {
		console.log('error during search', error)
	}
}
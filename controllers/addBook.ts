import { Response, Request } from 'express'
import { Books } from '../model/books'

export async function addBook(req: Request, res: Response) {
	try {
		await Books.addNew(req.body);
		res.redirect('/')
	} catch (error) {
		res.status(500).end()
		console.log('error addBook', error)
	}
}
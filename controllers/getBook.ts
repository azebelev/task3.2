import { Books } from '../model/books';
import { Request, Response } from 'express';

export async function getBook(req: Request, res: Response) {

	try {
		await Books.update('visits', +req.params.id)
		const book = await Books.findOne(req.params.id);
		res.render('book', {
			book,
			visitsCounter: book.visits,
			csrfToken: req.csrfToken()
		})
	} catch (error) {
		console.log('getBook');
		res.status(500).end();
	}
}
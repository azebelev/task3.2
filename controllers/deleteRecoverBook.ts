import { Response, Request } from 'express'
import { Books } from '../model/books'
import { home } from './home'


export async function deleteRecoverBook(req: Request, res: Response) {
	if (req.auth?.user === 'admin') {
		try {
			await Books.deleteRecover(req.body.id);
			if (req.body.pageNumber) res.redirect(`/?pageNumber=${req.body.pageNumber}`)
			else res.redirect('/');
		} catch (error) {
			console.log('error during deleteRecover', error);
		}
	} else res.status(500).send('<p>this opportunity available only for administrator</p>')
}
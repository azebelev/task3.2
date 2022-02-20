import { Request, Response } from 'express';
import { Books } from '../model/books';


export async function clickCounter(req: Request, res: Response) {
	try {
		await Books.update('clicks', req.body.id)
		res.status(200).end()
	} catch (error) {
		console.log(error)
		res.status(500).end()
	}
} 
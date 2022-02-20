import { Request, Response } from 'express';

export function logout(req: Request, res: Response) {
	res.clearCookie('connect.sid')
	res.status(401).end();
}  
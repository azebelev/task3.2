
type Book = {
	name: string,
	img: string,
	year: number,
	author1?: string,
	author2?: string,
	author3?: string,
	size: string,
	descr: string,
	clicks: number,
	visits: number
}

type Page = {
	pageNumber?: number | undefined,
	active?: boolean | undefined
}
declare namespace Express {
	interface Request {
		auth?: {
			user: string,
			password: string
		}
	}
}




import { Request } from 'express';
import dotenv from 'dotenv'

dotenv.config()


export class Pagination {
	last_page: boolean = false
	first_page: boolean = true
	required: boolean = false
	offset: number = 0
	pageNumber: number = 1
	offset_step: number
	pages: Array<Page> = []


	constructor(offset_step: number) {
		this.offset_step = offset_step
	}
	refreshOffset(req: Request) {
		if (req.query) {
			if (req.query.pageNumber) {
				this.offset = +req.query.pageNumber * this.offset_step - this.offset_step
				this.pageNumber = +req.query.pageNumber
				if (this.offset >= this.offset_step) this.first_page = false

				return
			}
			if (req.query.pageUp) this.offset = +req.query.pageUp + this.offset_step
			if (req.query.pageDown) this.offset = +req.query.pageDown - this.offset_step;
			this.pageNumber = this.offset / this.offset_step + 1
			if (this.offset <= 0) {
				this.offset = 0
				this.first_page = true
			} else this.first_page = false
		}
	}
	refresh(availablePages: number, max_pagination_length: number) {

		const last_possible_pagination = this.pageNumber + (availablePages - 1);

		let first_pagination = this.pageNumber - Math.ceil((max_pagination_length - 1) / 2);
		if (first_pagination < 1) first_pagination = 1;

		let last_pagination = first_pagination + (max_pagination_length - 1);

		if (last_pagination > last_possible_pagination) {
			last_pagination = last_possible_pagination;
			first_pagination = last_pagination - max_pagination_length + 1;
			if (first_pagination < 1) first_pagination = 1;
		}
		if (availablePages > 1) {
			this.last_page = false;
			this.required = true;
		}
		if (this.pageNumber === last_pagination) this.last_page = true;
		this.pages = []
		for (let i = first_pagination; i <= last_pagination; i++) {
			if (i !== this.pageNumber) {
				this.pages.push({ pageNumber: i })
			} else this.pages.push({ pageNumber: i, active: true })
		}
	}

}
import { Router } from 'express'
const router = Router()
import { home } from '../controllers/home'
import { logout } from '../controllers/logout'
import { addBook } from '../controllers/addBook'
import { deleteRecoverBook } from '../controllers/deleteRecoverBook'
import { search } from '../controllers/search'
import { getBook } from '../controllers/getBook'
import { clickCounter } from '../controllers/clickCounter'

router.all('/', home)
router.post('/logout', logout)
router.post('/add', addBook)
router.post('/changeStatus', deleteRecoverBook)
router.get('/search', search)
router.get('/book/:id', getBook)
router.post('/click_counter', clickCounter)


export { router }





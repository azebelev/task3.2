import express from 'express'
import { create } from 'express-handlebars'
import dotenv from 'dotenv'
import { router } from './routes/router'
import { authVieBasicAuth } from './middleware/auth'
import { initiateSchedule } from './model/scheduleCron';
import cookieParser from 'cookie-parser'
import csurf from 'csurf'


dotenv.config()
const PORT = process.env.PORT


const app = express()

const hbs = create({
	defaultLayout: 'main',
	extname: 'hbs'
})
app.engine('hbs', hbs.engine)
app.set('view engine', 'hbs')
app.set('views', 'views')

app.use(express.static('public'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser())
app.use(csurf({ cookie: true }))
app.use(authVieBasicAuth)
app.use(router)

app.listen(PORT, () => {
	console.log(`serving on port : ${PORT}`)
})

initiateSchedule()
import expressBasicAuth from 'express-basic-auth'

const users = { admin: '123', olesia: '123' }
export const authVieBasicAuth = expressBasicAuth({
	users, challenge: true
})

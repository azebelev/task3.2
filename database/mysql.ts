import mysql from 'mysql2'
import dotenv from 'dotenv'
dotenv.config()

const dbConfig = {
	password: process.env.DB_PASS,
	user: process.env.DB_USER,
	database: process.env.DB_NAME,
	host: process.env.DB_HOST,
	port: Number(process.env.DB_PORT)
}

export const db = mysql.createConnection({ ...dbConfig, multipleStatements: true })

type mysqlRespond = mysql.RowDataPacket[] | mysql.RowDataPacket[][] | mysql.OkPacket | mysql.OkPacket[] | mysql.ResultSetHeader

export function MyQuery<T extends mysqlRespond>(query: string, values: any): Promise<T> {

	db.connect();
	return new Promise((resolve, reject) => {
		db.query(query, values, (error, result: T) => {
			if (error) {
				reject(error)
			} else resolve(result);
		});
	});
};
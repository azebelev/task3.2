import mysqldump from 'mysqldump';
import * as cron from 'node-cron';
import { MyQuery } from '../database/mysql';
import path from 'path'
import { cwd } from 'process'
import dotenv from 'dotenv'
dotenv.config()
const dir = cwd()


const dumping = cron.schedule(`55 14 * * * `, async () => {
	try {
		const dumpFileName = `${Math.round(Date.now() / 1000)}dump.sql`

		await mysqldump({
			connection: {
				host: process.env.DB_HOST || 'localhost',
				user: process.env.DB_USER || 'root',
				password: process.env.DB_PASS || '123',
				database: process.env.DB_NAME || 'library',
			},
			dumpToFile: path.join(dir, 'database', 'dumps', dumpFileName)
		});
		console.log('dumping completed')
	} catch (error) {
		console.log('dumping failed', error)
	}

})

const removingDeleted = cron.schedule(`0 23 * * * `, async () => {
	try {
		const query = `DELETE FROM books WHERE deleted = true`;
		await MyQuery(query, '');
		console.log('removingDeleted completed')
	} catch (error) {
		console.log('deleting failed', error);
	}
});

export function initiateSchedule() {
	removingDeleted.start()
	dumping.start()
}






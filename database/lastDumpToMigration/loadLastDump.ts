import fs, { readdirSync } from 'fs';
import path from 'path';
import { cwd } from 'process';
const currentDir = cwd()

const files = fs.readdirSync(path.join(currentDir, 'database', 'dumps'))
const lastDumpName = files[files.length - 1]

const loadMigrationFileName = fs.readdirSync(path.join(currentDir, 'migrations', 'sqls'))
	.filter(fileName => /\S+loadDump-up.sql/g.test(fileName))[0]
fs.copyFileSync(path.join(currentDir, 'database', 'dumps', lastDumpName), path.join(currentDir, 'migrations', 'sqls', loadMigrationFileName))




console.log(loadMigrationFileName)




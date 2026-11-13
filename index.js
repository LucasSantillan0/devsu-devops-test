import sequelize from './shared/database/database.js'
import { usersRouter } from "./users/router.js"
import express from 'express'

const app = express()
const PORT = 8000

sequelize.sync().then(() => console.log('db is ready'))

app.use(express.json())
app.use('/api/users', usersRouter)
app.get('/health/live', (_, res) => res.json({ status: "Ok" }).status(200))
const server = app.listen(PORT, () => {
    console.log('Server running on port PORT', PORT)
})

export { app, server }
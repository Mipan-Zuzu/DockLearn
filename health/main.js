import express from 'express'
const app = express()
const port = 3035
const log = console.log

app.get("/health", (req, res) => {
    res.json(
        {
            "status" : 200,
            "info" : "OK"
        }
    )
})

app.listen(port, () => {
    log("server listen on port 3035")
})
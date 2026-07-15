import express from 'express'
import dotenv from "dotenv"

const app = express()
dotenv.config()

const varbelKey = process.env.PWD

app.get("/ping", (req, res) => {
    if (!varbelKey || varbelKey === "") {
        return "missing varibelKey"
    }
    res.json({
        message : "PONG",
        pwd : varbelKey ,
        name : process.env.NAME,
        number : process.env.NUMBER,
        auth_key : process.env.AUTH_KEY
    })
})

app.listen(3032, () => {
    console.log("server listen on port 3032")
})
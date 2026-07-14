import express from "express"

const app = express()

app.get("/ping", (req, res) => {
    res.json({ping: "pong"})
})

app.listen(3032, () => {
    console.log("listen on port 3032")
})


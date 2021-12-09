'use strict'

const express = require('express')
const mongoose = require('mongoose')
const app = express()
const Data = require('./logSchema')
const PORT = 3000
const HOST = '0.0.0.0'
mongoose.connect("mongodb://localhost/avyDB")

mongoose.connection.once("open", () => {
    console.log("connected to mongoose")
}).on("error", (error) => {
    console.log("failed to connect " + error)
})


// CREATE log
// post
app.post("/create", (req, res) => {
    var log = new Data({
        title: req.get("title"),
        date: req.get("date"),
        log: req.get("log"),
    })
    log.save().then(() => {
        if(log.isNew === false) {
            console.log("Saved data")
            res.send("200 saved")
        } else {
            console.log("Failed to persist log")
        }
    })
})


// DELETE log
//post

// UPDATE log
// post

// FETCH ALL logs
// get

app.get('/', (req, res) => {
    res.send('Hello world')
})

//localhost:8081
var server = app.listen(PORT, HOST, ()=>{
    console.log("server is running")
})

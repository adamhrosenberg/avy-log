const express = require('express')
const mongoose = require('mongoose')
var app = express()
var Data = require('./logSchema')

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



//localhost:8081
var server = app.listen(8081, "localhost", ()=>{
    console.log("server is running")
})

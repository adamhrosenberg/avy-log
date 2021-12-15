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
app.post("/delete", (req, res) => {
    Data.findOneAndRemove({
        _id: req.get("id")
    }, (err) => {
        console.log("failed to delete " + err)
    })
    res.send("deleted")
})

// UPDATE log
// post
app.post("/update", (req, res) => {
    Data.findOneAndUpdate({
        _id: req.get("id")
    }, {
        title: req.get("title"),
        date: req.get("date"),
        log: req.get("log"),
    }, (err) => {
        //todo: fix why this is being called even when update was successful
        console.log("error")
    })
    res.send("updated")
})

// FETCH ALL logs
// get
app.get('/fetch', (req, res) => {
    console.log("fetching...")
    Data.find({}).then((DBitems) => {
        res.send(DBitems)
    })
})


app.get('/', (req, res) => {
    res.send('Hello world')
})

//localhost:8081
var server = app.listen(PORT, HOST, ()=>{
    console.log("server is running")
})

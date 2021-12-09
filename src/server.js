const express = require('express')
const mongoose = require('mongoose')
var app = exress()
var data = require('./logSchema')

mongoose.connect("mongodb://localhost/avyDB")

mongoose.connection.once("open", () => {
    console.log("connected to mongoose")
}).on("error", (error) => {
    console.log("failed to connect " + error)
})






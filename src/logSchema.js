const mongoose = require('mongoose')
var Schema = mongoose.Schema

var log = new Schema({
    title: String,
    date: String,
    log: String
})

const Data = mongoose.mode("data", log)
module.exports = Data
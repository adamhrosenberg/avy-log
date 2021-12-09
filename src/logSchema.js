const mongoose = require('mongoose')
const Schema = mongoose.Schema;

const log = new Schema({
    title: String,
    date: String,
    log: String
});

const Data = mongoose.model("data", log)
module.exports = Data
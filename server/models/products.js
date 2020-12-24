const mongoose = require('mongoose');

const productSchema = mongoose.Schema({
    _id:{
        type:String,
        required:true
    },
    name:{
        type:String,
        required:true
    },
    desc:{
        type:String,
        required:true
    },
    price:{
        type:Number,
        required:true,
    },
    url:{
        type:String,
        required:true
    }
})

module.exports = mongoose.model('Products',productSchema);
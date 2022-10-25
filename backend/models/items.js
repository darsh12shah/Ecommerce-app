const mongoose = require('mongoose');

const ItemSchema = mongoose.Schema({
    Name:{
        type:String,
        required:true,
    },
    Vendor:{
        type:mongoose.Types.ObjectId,
        ref:'Vendor',
    },
    Reviews : {
        type:String
    },
    Content:{
        type:String
    },
    NumOfReviews : {
        type:Number,
        default : 0
    },
    DateAdded:{
        type:Date,
        default : Date.now()
    },
    cost:{
        type:Number,
        required:true
    },
    Description:{
        type:String
    },
    Availability: [{
        size:{
            type:String,
        },
        quauntity:{
            type:Number
        }
    }],
    category:[{
        type:String,
        required:true
    }],
    imageData : [
        {
            type:String
        }
    ]
})

module.exports = mongoose.model('Item',ItemSchema);
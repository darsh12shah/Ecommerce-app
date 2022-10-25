const mongoose = require('mongoose');

const UserSchema = mongoose.Schema({
    name:{
        type:String,
        required: true
    },
    mobileNumber : {
        type:String,
        required: true
    },
    email : {
        type:String,
        required:true
    },
    password:{
        type:String,
        required:true
    },
    CreatedOn: {
        type:Date,
        default : Date.now()
    },
    cart:[{
        item:{type:mongoose.Types.ObjectId,ref:'Item'},
        QtyAndSize:{Qty:{type:Number},Size:{type:Number}}
    }],
    Liked:{
        type:mongoose.Types.ObjectId,
        ref:'Item'
    },
    orders:[
        {
            item:{type:mongoose.Types.ObjectId,ref:'Item'},
            QtyAndSize:{Qty:{type:Number},Size:{type:Number}}
        }
    ]
})

module.exports = mongoose.model('User',UserSchema);
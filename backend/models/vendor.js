const mongoose = require('mongoose');

const VendorSchema = mongoose.Schema({
    name:{
        type:String,
        rewquired:true
    },
    email:{
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
    mobileNumber:{
        type:String,
        required:true
    }
});

module.exports = mongoose.model('Vendor',VendorSchema);
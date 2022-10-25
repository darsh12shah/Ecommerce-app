const express = require('express');
const Vendor = require('../models/vendor');
const router = express.Router();
const Item = require('../models/items');



router.get('/:category',(req,res)=>{
    let category = req.params.category;
    Item.find({category:category}).then(items=>{
        if(items.length<1){
            res.send('No Items Available in the following Category');
            res.status(404);
        }
        else{
            res.send(items);
            res.status(200);
        }
    })
})

router.get('/itemSearch',(req,res)=>{
    const regex = new RegExp(req.body.string, 'i');
    Item.find({name:{$regex: regex}},{name:1,_id:1}).limit(5).then(docs=>{
        res.send(docs);
    }).catch(err=>{
        res.send(err);
    })
})

router.get('/itemSearch/:item',(req,res)=>{
    const item = new Regexp(req.params.item,'i');
    Item.find({name:{$regex : item}},{image:1,name:1,cost:1,_id:1}).then(docs=>{
        res.send(docs);
    }).catch(err=>{
        res.send(err);
    })
})

router.get('/:itemName',(req,res)=>{
    const itemName = req.params.itemName;
    Item.findOne({name:itemName}).then(doc=>{
        res.send(doc);
    }).catch(err=>{
        res.send(err);
    })
})

module.exports = router;
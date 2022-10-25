const express = require('express');
const mongoose = require('mongoose');
const User = require('../models/user');
const router = express.Router();
const Item = require('../models/items');
router.post('/signup',(req,res)=>{
    User.findOne({mobileNumber : req.body.mobileNumber},(err,user)=>{
        if(err){
            console.log(err)
            res.json(err)
        }else{
            if(user == null){
                const user = User({
                    mobileNumber : req.body.mobileNumber,
                    email : req.body.email,
                    password: req.body.password,
                    name:req.body.name
                })
                user.save().then(err=>{
                    if(err){
                        console.log(err);
                        res.json(err);
                    }
                    else{
                        res.json(user);
                    }
                })
            }else{
                res.status(409);
                res.json({
                    message : 'mobile number  is already taken'
                })
            }
        }
    })
})

router.post('/signin',(req,res)=>{
    console.log(req.body);
    User.findOne({mobileNumber:req.body.mobileNumber,password:req.body.password},(err,user)=>{
        if(err){
            console.log(err);
            res.status(404);
        }
        else if(user!==null){
            req.Id = user._id;
            res.status(200);
            return res.json(user);
        }else{
            res.status(404);
            return res.json({
                message : 'User Details not found'
            })
        }
    })
})



router.post('/:number/BuyOrders',(req,res)=>{
    let number = req.params.number;
    let OrderItems = req.body.orderItems;
        User.findOne({mobileNumber:number}).then((oUser=>{
            OrderItems.forEach(element => {
                let order = {
                    item:mongoose.Types.ObjectId(element.item),
                    QtyAndSize:{
                        Qty:element.QtyAndSize.Qty,
                        Size:element.QtyAndSize.Size
                    }
                }
                oUser.orders.push(order)
            });
            oUser.save((err,user)=>{
                if(err){
                    res.status(400)
                    return res.send(err);
                }else{
                    res.status(200);
                    return res.send('Order Placed!')
                }
            })
        })).catch(err=>{
            res.status(400);
            return res.send(err);
        })
})


router.get('/:number/getOrders',(req,res)=>{
    let number = req.params.number;
    User.findOne({mobileNumber:number}).populate({path:'orders.item',model:'Item'}).then(userProducts=>{
        if(!userProducts){
            res.status(404);
            res.send('User not Found');
        }else{
            res.status(200);
            res.send(Object.values(userProducts.orders));
        }
    })
})


router.get('/:number/getCart',(req,res)=>{
    let number = req.params.number;
    User.findOne({mobileNumber:number}).populate({path:'cart.itemId',model:'Item'}).lean().then(userProducts=>{
        res.status(200);
        items = Object.values(userProducts.cart)
        return res.send(items);
    }).catch(err=>{
        res.status(400);
        return res.send(err);
    })
}) 


router.post('/:number/AddToLiked',(req,res)=>{
    let number = req.params.number;
    Item.findOne({_id:mongoose.Types.ObjectId(req.body._id)}).lean().then(oItem=>{
        User.findOneAndUpdate({mobileNumber:number},{$push:{Liked: mongoose.Types.ObjectId(oItem._id) }}).then(oUser=>{
            res.status(200);
            return res.send('Added to Liked!');
        }).catch(err=>{
            res.status(400);
            return res.send(err);
        })
    })
})

router.post('/:number/AddToCart',(req,res)=>{
    let number = req.params.number;
    Item.findOne({_id:req.body._id}).lean().then(oItem=>{
        User.findOneAndUpdate({mobileNumber:number},{$push:{cart:{itemId:mongoose.Types.ObjectId(oItem._id),QtyAndSize:{Qty:req.body.Qty,Size:req.body.Size}}}}).then(oUser=>{
            res.status(200);
            return res.send('Added to  Cart!');
        }).catch(err=>{
            res.status(400);
            return res.send(err);
        })
    })
})

router.get('/:number/getLiked',(req,res)=>{
    let number = req.params.number;
    User.findOne({mobileNumber:number}).populate({path:'Liked',model:'Item'}).lean().then(oItems=>{
        res.status(200);
        return res.send(Object.values(oItems.Liked));
    }).catch(err=>{
        res.status(400);
        return res.send(err);
    })
})


router.post('/:number/removeItemFromLiked',(req,res)=>{
    let number = req.params.number;
    User.findOne({mobileNumber:number}).then((oUser=>{
        oUser.Liked.pull(mongoose.Types.ObjectId(req.body._id));
        res.status(200);
        return res.send('Removed from liked!');
    }))
})

module.exports = router;



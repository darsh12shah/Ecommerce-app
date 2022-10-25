const express = require('express');
const Vendor = require('../models/vendor');
const router = express.Router();
const Item = require('../models/items');


router.post('/signup', (req, res) => {
    Vendor.findOne({ mobileNumber: req.body.mobileNumber }, (err, vendor) => {
        if (err) {
            console.log(err)
            res.json(err)
        } else {
            if (vendor == null) {
                const vendor = Vendor({
                    mobileNumber: req.body.mobileNumber,
                    email: req.body.email,
                    password: req.body.password,
                    name: req.body.name
                })
                vendor.save().then(err => {
                    if (err) {
                        console.log(err);
                        res.json(err);
                    }
                    else {
                        res.json(vendor);
                    }
                })
            } else {
                res.status(409);
                res.json({
                    message: 'mobile number  is already taken'
                })
            }
        }
    })
})

router.post('/signin', (req, res) => {
    Vendor.findOne({ mobileNumber: req.body.mobileNumber, password: req.body.password }, (err, vendor) => {
        if (err) {
            console.log(err);
            res.status(404);
        }
        else if (vendor !== null) {
            req.Id = vendor._id;
            res.status(200);
            res.json(vendor);
        } else {
            res.status(404);
            res.json({
                message: 'Vendor Details not found'
            })
        }
    })
})

router.post('/:number/addItem', async (req, res) => {
    let number = req.params.number;
    let VendorId = await Vendor.findOne({ mobileNumber: number }, { _id: 1 }).catch(err => {
        res.send(err);
    });
            let item = new Item();
            item.Name = req.body.name;
            item.Vendor = VendorId._id;
            item.cost = req.body.cost;
            item.Description = req.body.Description;
            item.Availability = req.body.Availability,
            item.category = req.body.category.split(",").;
            item.imageData = req.body.image;
            item.save((err, SavedItem) => {
                if (err) {
                    res.send(err);
                } else {
                    Vendor.findOneAndUpdate({ mobileNumber: number }, { $push: { Items: SavedItem._id } }).then(
                        res.send('Succesfully Added the Item')
                    ).catch(err => {
                        res.send(err);
                    });
                }
            })
})

router.get('/:number/myItems', (req, res) => {
    let mobileNumber = req.params.number;
    Vendor.find({ mobileNumber: mobileNumber }).populate({ path: 'Items', model: 'Item', select: { name: 1, cost: 1, image: 1 } }).then(items => {
        res.send(items);
    }).catch(err => {
        res.send(err);
    })
})

module.exports = router;
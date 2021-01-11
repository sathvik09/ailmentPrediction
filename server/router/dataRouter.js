const express = require('express');
const router = express.Router();

// controller imports
const {getData,addData,addCart} = require('../controllers/dataControler');

// controller to get and return data

router.get('/getData',getData);
router.post('/addCart',addCart);
router.get('/addData',addData);

// export router
exports.dataRouter = router;
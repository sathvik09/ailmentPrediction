const express = require('express');
const router = express.Router();

// controller imports
const {getData,addData} = require('../controllers/dataControler');

// controller to get and return data
router.get('/getData',getData);
router.post('/addData',addData);

// export router
exports.dataRouter = router;
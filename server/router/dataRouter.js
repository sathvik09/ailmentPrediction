const express = require('express');
const router = express.Router();

// controller imports
const {getData} = require('../controllers/dataControler');

// controller to get and return data
router.use('/',getData);

// export router
exports.dataRouter = router;
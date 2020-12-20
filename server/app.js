const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const morgan = require('morgan');
const {mongooseConnect} = require('./models/mongooseConnect');

const app = express();
app.use(morgan('dev'));
app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());  
//mongoose connection
mongooseConnect();

// routing
const {dataRouter} = require('./router/dataRouter');

app.use('/data',dataRouter);

exports.app = app;
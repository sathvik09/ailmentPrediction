const express = require('express');

exports.getData = (req,res,next)=>{
    res.send('<h1>Controller working!<h1>');
    console.log('dsadas');
}
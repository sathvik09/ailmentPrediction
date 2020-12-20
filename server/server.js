const http = require('http');
const port = 5000;

//app 
const {app} = require('./app');
const server = http.createServer(app);

server.listen(port);
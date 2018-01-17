
var express = require('express');
var uuid = require('uuid');

var app = express();
var id = uuid.v4();
var port = 3000;

app.use(express.static(__dirname));



app.get('/', function(req, res) {
	res.sendFile('index.html', { root : __dirname });
});

app.listen(port, function () {
  console.log('Example app listening on port: ' + port);
});


/**
 * Module dependencies.
 */

var express = require('express');
var routes = require('./routes');
var user = require('./routes/user');
var http = require('http');
var path = require('path');
var socket = require('socket.io');

var app = express();


// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(app.router);
app.use(express.static(path.join(__dirname, 'public')));

// development only
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

//app.get('/', routes.index);
//app.get('/users', user.list);

var server = http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});

var io = socket.listen(server);

app.get('/', function(req, res){
	res.sendfile(__dirname + '/index.html');
    });

app.post('/', function(req, res){
	//	console.log('***** CSPARQL Request Received *****');

	console.log(req.body)
	req.on('data', function(chunk){
		//console.log(chunk.toString());
		res.send(chunk.toString());		
		io.sockets.emit('news', {data: chunk.toString()});
	    });



    });

io.sockets.on('connection', function(socket){
	/**
	socket.emit('news', {hello: 'world'});
	socket.on('my other event', function(data){
		console.log(data);
	    });
	*/
});

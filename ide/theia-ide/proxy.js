const httpProxy = require('http-proxy');
const http = require('http');
const basicAuth = require('basic-auth');

var username = process.env['username'] || 'developer';
var password = process.env['password'] || 'password';


var proxy = httpProxy.createProxyServer({
	target: {
		host: 'localhost',
		port: 3000
	},
	ws: true
});

var send401 = function(res) {
	res.statusCode = 401;
	res.setHeader('WWW-Authenticate', 'Basic realm=Authorization Required');
	res.end('<html><body>Need some creds son</body></html>');
};

var proxyServer = http.createServer(function (req, res) {
	var user = basicAuth(req);
	if (!user) {
		send401(res);
		return;
	}
	if (user.name !== username || user.pass !== password) {
		send401(res);
		return;
	}
	proxy.web(req, res);
});

proxyServer.on('upgrade', function (req, socket, head) {
	proxy.ws(req, socket, head);
});

proxyServer.listen(5050);
console.log("listen 5050");

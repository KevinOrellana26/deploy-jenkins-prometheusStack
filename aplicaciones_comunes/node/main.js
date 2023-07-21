// Import module
var http = require("http");

// Create server
http.createServer(function (request, response){
    // Send the HTTP header
    // HTTPS Status: 200 : OK
    // content Type: text/plain
    response.writeHead(200, {'Content-Type': 'text/plain'});

    // Send the response body as "Hello World"
    response.end('Hello World\n');
}).listen(8081);

// Console will print the message
console.log('Server running at http://127.0.0.1:8081/');

// El código anterior es suficiente para crear un servidor HTTP que escucha, es decir, espera una solicitud a través del puerto 8081 en la máquina local.


// clinic bubbleprof -- node test_server.js

const http = require('http')

http.createServer(handler).listen(45678)
console.log("testing server running at: http://127.0.0.1:45678/");

function handler (req, res) {
  // make this slow
  for (let i = 0; i < 1000000; i++) {}
  res.end('ok')
}

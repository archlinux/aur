// Simple token server for Twitch App Access Token
// Usage: set environment variables CLIENT_ID and CLIENT_SECRET, then
//   node token-server.js

const http = require('http');
const https = require('https');
const url = require('url');

const PORT = process.env.PORT || 3000;
const CLIENT_ID = process.env.CLIENT_ID;
const CLIENT_SECRET = process.env.CLIENT_SECRET;

if (!CLIENT_ID || !CLIENT_SECRET) {
  console.error('Please set CLIENT_ID and CLIENT_SECRET environment variables');
  process.exit(1);
}

function fetchAppToken(callback) {
  const postPath = `/oauth2/token`;
  const postBody = `client_id=${encodeURIComponent(CLIENT_ID)}&client_secret=${encodeURIComponent(CLIENT_SECRET)}&grant_type=client_credentials`;
  const opts = {
    hostname: 'id.twitch.tv',
    path: postPath,
    method: 'POST',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Content-Length': Buffer.byteLength(postBody)
    }
  };

  const req = https.request(opts, (res) => {
    let data = '';
    res.on('data', (chunk) => data += chunk);
    res.on('end', () => {
      // Log status for easier debugging
      console.log('Twitch token response status:', res.statusCode);
      console.log('Twitch token response body:', data);
      try {
        const parsed = JSON.parse(data);
        callback(null, parsed);
      } catch (e) {
        callback(e || new Error('Failed to parse response'));
      }
    });
  });

  req.on('error', (e) => callback(e));
  req.write(postBody);
  req.end();
}

const server = http.createServer((req, res) => {
  const u = url.parse(req.url, true);
  if (u.pathname === '/twitch-token') {
    fetchAppToken((err, body) => {
      if (err) {
        res.writeHead(500, {'Content-Type': 'application/json'});
        res.end(JSON.stringify({ error: 'token_fetch_failed', detail: String(err) }));
        return;
      }
      res.writeHead(200, {'Content-Type': 'application/json'});
      res.end(JSON.stringify(body));
    });
  } else {
    res.writeHead(404);
    res.end('Not found');
  }
});

server.listen(PORT, () => {
  console.log(`Token server listening on http://localhost:${PORT}`);
  console.log('Endpoint: /twitch-token');
});

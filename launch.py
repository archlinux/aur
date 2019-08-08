#!/usr/bin/env python3

from http import server

PORT = 4242


class WasmAwareRequestHandler(server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.extensions_map['.wasm'] = 'application/wasm'


httpd = server.HTTPServer(('localhost', PORT), WasmAwareRequestHandler)
print('Starting server on port %d' % PORT)
httpd.serve_forever()

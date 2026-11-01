"""Keep the four upstream URL/parser cases reproducible with pinned HTTP data."""
import hashlib
import http.server
import os
import sys
from pathlib import Path
import threading
import urllib.request

import pytest


_CASES = {
    'test_init_artifact_from_url_error_on_non_artifact',
    'test_init_metadata_from_url',
    'test_init_metadata_from_url_error_on_non_metadata',
    'rachis.sdk.usage.Usage.init_metadata_from_url',
}
_URLS = {
    'https://data.qiime2.org/2022.11/tutorials/moving-pictures/sample_metadata.tsv': '/metadata',
    'https://data.qiime2.org/usage-examples/moving-pictures/sample-metadata.tsv': '/metadata',
    'https://docs.qiime2.org/': '/html',
}
_FILES = {
    '/metadata': ('moving-pictures-metadata.tsv',
                  '9dbfbedd90776d77c431faa914d81b0d6299fff10c364216dbcd5c6df5382cc9',
                  'text/tab-separated-values'),
    '/html': ('invalid-metadata.html',
              '3349e20cc6c76279718a6370ee30ebe311afc5531b0e61f1f682f55dafa37366',
              'text/html'),
}


def pytest_sessionstart(session):
    import rachis
    assert Path(rachis.__file__).resolve().is_relative_to(Path(sys.prefix).resolve())


def pytest_collection_modifyitems(items):
    selected = [item for item in items if item.name in _CASES]
    assert len(selected) == 4, 'All four upstream URL/parser cases must be retained'


@pytest.fixture(scope='session')
def usage_http_server():
    directory = Path(os.environ['RACHIS_TEST_FIXTURES'])
    responses = {}
    for route, (filename, digest, content_type) in _FILES.items():
        data = (directory / filename).read_bytes()
        assert hashlib.sha256(data).hexdigest() == digest
        responses[route] = (data, content_type)

    class Handler(http.server.BaseHTTPRequestHandler):
        def do_GET(self):
            if self.path not in responses:
                self.send_error(404)
                return
            data, content_type = responses[self.path]
            self.send_response(200)
            self.send_header('Content-Type', content_type)
            self.send_header('Content-Length', str(len(data)))
            self.end_headers()
            self.wfile.write(data)

        def log_message(self, *_args):
            pass

    server = http.server.ThreadingHTTPServer(('127.0.0.1', 0), Handler)
    thread = threading.Thread(target=server.serve_forever, daemon=True)
    thread.start()
    try:
        yield 'http://127.0.0.1:%d' % server.server_port
    finally:
        server.shutdown()
        server.server_close()
        thread.join(timeout=5)
        assert not thread.is_alive()


@pytest.fixture(autouse=True)
def pinned_usage_urls(request, monkeypatch):
    if request.node.name not in _CASES:
        return
    origin = request.getfixturevalue('usage_http_server')
    original = urllib.request.urlopen
    local = urllib.request.build_opener(urllib.request.ProxyHandler({}))
    requests = []

    def urlopen(url, *args, **kwargs):
        address = url.full_url if isinstance(url, urllib.request.Request) else url
        if address not in _URLS:
            return original(url, *args, **kwargs)
        # Limit interception to three exact URLs in these four test items.
        headers = dict(url.header_items()) if isinstance(url, urllib.request.Request) else {}
        method = url.get_method() if isinstance(url, urllib.request.Request) else 'GET'
        assert method == 'GET'
        mapped = urllib.request.Request(origin + _URLS[address], headers=headers)
        response = local.open(mapped, *args, **kwargs)
        assert response.status == 200
        assert response.headers['Content-Type'] == _FILES[_URLS[address]][2]
        requests.append(address)
        return response

    monkeypatch.setattr(urllib.request, 'urlopen', urlopen)
    request.addfinalizer(lambda: requests or pytest.fail('Pinned HTTP fixture was not requested'))

"""Run upstream usage examples with hash-pinned HTTP fixture responses."""
import hashlib
import http.server
import os
from pathlib import Path
import threading
import urllib.request

import pytest


_CASE = ('q2_feature_table.tests.test_examples', 'TestUsageExample', 'test_usage_examples')
_URLS = {
    'https://data.qiime2.org/usage-examples/moving-pictures/sample-metadata.tsv': (
        'usage-sample-metadata.tsv',
        '9dbfbedd90776d77c431faa914d81b0d6299fff10c364216dbcd5c6df5382cc9',
        'text/tab-separated-values'),
    'https://data.qiime2.org/usage-examples/filtering/table.qza': (
        'usage-filtering-table.qza',
        '0efe295afb8bb4b1d3ec836346ad09aebf51cbd6db51e2d7a3515625b966abbf',
        'binary/octet-stream'),
    'https://data.qiime2.org/usage-examples/metadata/rep-seqs.qza': (
        'usage-rep-seqs.qza',
        '0de504061ecb85462fbfe4a09636050820292379cf860d9834980d04dae22dd9',
        'binary/octet-stream'),
    'https://data.qiime2.org/usage-examples/moving-pictures/rep-seqs-dada2.qza': (
        'usage-dada2.qza',
        'b081ce79cdf92328812d5819db3089b5199b771cc643801893526b4bd36d3bba',
        'binary/octet-stream'),
    'https://data.qiime2.org/usage-examples/moving-pictures/rep-seqs-deblur.qza': (
        'usage-deblur.qza',
        'ad6e8e9d129e0f5d41379679ac39e0f094cdecf6cfd7b53eaeb01ce3f3bc6066',
        'binary/octet-stream'),
    'https://docs.qiime2.org/jupyterbooks/cancer-microbiome-intervention-tutorial/data/030-tutorial-downstream/020-taxonomy/taxonomy.qza': (
        'usage-cancer-taxonomy.qza',
        '14bb7fa2e85968098db77292d7cf5275ca3ce72b13ff77243147ed99969ea130',
        'application/octet-stream'),
}


def _identity(item):
    return (item.module.__name__, item.cls.__name__ if item.cls else None,
            item.name)


def pytest_collection_modifyitems(items):
    assert sum(_identity(item) == _CASE for item in items) == 1, \
        'The original upstream usage-example test must be retained'


@pytest.fixture(scope='session')
def usage_http_server():
    directory = Path(os.environ['Q2_TEST_FIXTURES'])
    responses = {}
    for index, (filename, digest, content_type) in enumerate(_URLS.values()):
        data = (directory / filename).read_bytes()
        assert hashlib.sha256(data).hexdigest() == digest, filename
        responses['/' + str(index)] = (data, content_type)

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
    if _identity(request.node) != _CASE:
        yield
        return
    origin = request.getfixturevalue('usage_http_server')
    local = urllib.request.build_opener(urllib.request.ProxyHandler({}))
    routes = {url: '/' + str(i) for i, url in enumerate(_URLS)}
    requested = set()

    def urlopen(url, *args, **kwargs):
        is_request = isinstance(url, urllib.request.Request)
        address = url.full_url if is_request else url
        assert address in _URLS, ('Unexpected usage fixture URL', address)
        assert not is_request or url.get_method() == 'GET'
        assert not args or args[0] is None
        assert kwargs.get('data') is None
        headers = dict(url.header_items()) if is_request else {}
        mapped = urllib.request.Request(origin + routes[address], headers=headers)
        response = local.open(mapped, *args, **kwargs)
        assert response.status == 200
        assert response.headers['Content-Type'] == _URLS[address][2]
        requested.add(address)
        return response

    # Only this original test item uses the exact pinned URLs. The real HTTP
    # response and upstream artifact/metadata parsers remain in use.
    monkeypatch.setattr(urllib.request, 'urlopen', urlopen)
    yield
    assert requested == set(_URLS), ('Usage fixtures not exercised', set(_URLS) - requested)
    print('Pinned usage HTTP fixtures exercised:', sorted(requested))

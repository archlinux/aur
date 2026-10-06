"""Offline checks against the relocated environment that pacman will install."""
from importlib import metadata
from pathlib import Path
import asyncio
import json
import socket
import subprocess
import sys
import tempfile
import time

import httpx

from argon2 import PasswordHasher
from celpy import Environment
from omnigent_client import OmnigentClient
from omnigent_ui_sdk import __file__ as ui_file
from omnigent.update_check import upgrade_command_for_installed
from sqlalchemy import create_engine, text
from websockets.asyncio.client import connect
from websockets.asyncio.server import serve

assert metadata.version('omnigent') == sys.argv[1]
assert metadata.version('omnigent-client') == sys.argv[1]
assert metadata.version('omnigent-ui-sdk') == sys.argv[1]
assert Path(ui_file).is_relative_to(sys.prefix)
assert OmnigentClient
hasher = PasswordHasher()
assert hasher.verify(hasher.hash('packaging-check'), 'packaging-check')
cel = Environment()
assert cel.program(cel.compile('6 * 7')).evaluate({}) == 42
with create_engine('sqlite://').connect() as database:
    assert database.execute(text('select 42')).scalar() == 42


async def round_trip():
    async def echo(websocket):
        await websocket.send(await websocket.recv())

    async with serve(echo, '127.0.0.1', 0) as server:
        port = server.sockets[0].getsockname()[1]
        async with connect(f'ws://127.0.0.1:{port}') as websocket:
            await websocket.send(json.dumps({'packaging': 'ok'}))
            assert json.loads(await websocket.recv()) == {'packaging': 'ok'}


asyncio.run(round_trip())
assert not list(Path(sys.prefix).glob('lib/python*/site-packages/claude_agent_sdk/_bundled'))
assert metadata.distribution('omnigent').read_text('INSTALLER').strip() == 'pacman'
suggestion = upgrade_command_for_installed()
assert suggestion is not None and not suggestion.runnable
print('PASS relocated SDK imports, password hashing, CEL, SQLite and WebSocket round trip')

with tempfile.TemporaryDirectory(prefix='omnigent-server-check-') as directory:
    root = Path(directory)
    with socket.socket() as listener:
        listener.bind(('127.0.0.1', 0))
        port = listener.getsockname()[1]
    env = dict(PATH='/usr/bin:/bin', HOME=str(root), PYTHONDONTWRITEBYTECODE='1',
               OMNIGENT_NO_UPDATE_CHECK='1', OMNIGENT_CONFIG_HOME=str(root / 'config'),
               OMNIGENT_DATA_DIR=str(root / 'data'), OMNIGENT_AUTH_PROVIDER='accounts',
               OMNIGENT_ACCOUNTS_INIT_ADMIN_USERNAME='audit',
               OMNIGENT_ACCOUNTS_INIT_ADMIN_PASSWORD='temporary-audit-password')
    with (root / 'server.log').open('w+') as log:
        server = subprocess.Popen([
            sys.executable, '-m', 'omnigent', 'server', '--host', '127.0.0.1',
            '--port', str(port), '--no-open', '--database-uri', f'sqlite:///{root}/chat.db',
            '--artifact-location', str(root / 'artifacts'),
        ], cwd=root, env=env, stdout=log, stderr=subprocess.STDOUT)
        try:
            with httpx.Client(base_url=f'http://127.0.0.1:{port}', trust_env=False, timeout=5) as client:
                deadline = time.monotonic() + 90
                while True:
                    assert server.poll() is None, 'Isolated server exited during startup'
                    try:
                        response = client.get('/health')
                        if response.status_code == 200:
                            assert response.json()['status'] == 'ok'
                            break
                    except httpx.TransportError:
                        pass
                    assert time.monotonic() < deadline, 'Isolated server startup timed out'
                    time.sleep(0.5)
                assert client.get('/auth/me').status_code == 401
                assert client.post('/auth/login', json={'username': 'audit', 'password': 'wrong'}).status_code == 401
                assert client.post('/auth/login', json={'username': 'audit', 'password': env['OMNIGENT_ACCOUNTS_INIT_ADMIN_PASSWORD']}).status_code == 200
                identity = client.get('/auth/me')
                assert identity.status_code == 200
                assert identity.json()['id'] == 'audit' and identity.json()['is_admin']
        except BaseException:
            log.seek(0)
            print(log.read(), file=sys.stderr)
            raise
        finally:
            server.terminate()
            try:
                server.wait(timeout=15)
            except subprocess.TimeoutExpired:
                server.kill()
                server.wait()
print('PASS isolated server health, rejected anonymous/wrong-password access and authenticated admin')

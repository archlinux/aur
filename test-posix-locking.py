"""Check sync/async storage exclusion and lock release across processes."""
import asyncio
import subprocess
import sys
from tempfile import TemporaryDirectory

from qdrant_client import AsyncQdrantClient, QdrantClient


child = r'''
import asyncio
import sys
from qdrant_client import AsyncQdrantClient, QdrantClient

path, mode, expected = sys.argv[1:]
cls = AsyncQdrantClient if mode == 'async' else QdrantClient
try:
    client = cls(path=path)
except RuntimeError as error:
    assert expected == 'blocked', str(error)
    assert 'already accessed by another instance' in str(error), str(error)
else:
    assert expected == 'available', 'A second process acquired an exclusive lock'
    if mode == 'async':
        asyncio.run(client.close())
    else:
        client.close()
'''

for owner_mode in ('sync', 'async'):
    with TemporaryDirectory() as path:
        cls = AsyncQdrantClient if owner_mode == 'async' else QdrantClient
        owner = cls(path=path)
        for contender_mode in ('sync', 'async'):
            subprocess.run([sys.executable, '-P', '-c', child, path, contender_mode, 'blocked'],
                           check=True, timeout=30)
        if owner_mode == 'async':
            asyncio.run(owner.close())
        else:
            owner.close()
        for contender_mode in ('sync', 'async'):
            subprocess.run([sys.executable, '-P', '-c', child, path, contender_mode, 'available'],
                           check=True, timeout=30)

print('Sync/async process exclusion and lock release: PASS (8 checks)')

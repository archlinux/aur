import hashlib
import importlib.machinery
import importlib.util
import io
import json
from pathlib import Path
import shutil
import subprocess
import sys
import tarfile
import tempfile
import unittest
from unittest.mock import patch

loader = importlib.machinery.SourceFileLoader('updater', str(Path(__file__).with_name('vscode-update')))
spec = importlib.util.spec_from_loader(loader.name, loader)
updater = importlib.util.module_from_spec(spec)
loader.exec_module(updater)


class UpdateSafety(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(prefix='vscode-update-test-')
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        self.previous = self.root / ('release-' + '1' * 40)
        self.previous.mkdir()
        (self.root / 'current').symlink_to(self.previous.name)
        self.root_patch = patch.object(updater, 'ROOT', self.root)
        self.root_patch.start()
        self.addCleanup(self.root_patch.stop)
        self.argv_patch = patch.object(sys, 'argv', ['vscode-update'])
        self.argv_patch.start()
        self.addCleanup(self.argv_patch.stop)

    def attempt(self, archive, checksum):
        metadata = {
            'version': '2' * 40,
            'sha256hash': checksum,
            'url': 'https://vscode.download.prss.microsoft.com/test.tar.gz',
            'productVersion': 'test',
        }
        with patch.object(updater, 'fetch', side_effect=[
            io.BytesIO(json.dumps(metadata).encode()), io.BytesIO(archive),
        ]):
            updater.main()

    def assert_previous_preserved(self):
        self.assertEqual((self.root / 'current').resolve(), self.previous)
        self.assertTrue(self.previous.is_dir())
        self.assertFalse(list(self.root.glob('.update-*')))
        self.assertFalse((self.root / ('release-' + '2' * 40)).exists())

    def test_checksum_failure_preserves_current_release(self):
        with self.assertRaisesRegex(ValueError, 'SHA-256'):
            self.attempt(b'corrupted download', '0' * 64)
        self.assert_previous_preserved()

    def test_archive_cannot_escape_extraction_directory(self):
        archive = io.BytesIO()
        with tarfile.open(fileobj=archive, mode='w:gz') as bundle:
            member = tarfile.TarInfo('../../escaped')
            member.size = 6
            bundle.addfile(member, io.BytesIO(b'escape'))
        data = archive.getvalue()
        with self.assertRaises(tarfile.FilterError):
            self.attempt(data, hashlib.sha256(data).hexdigest())
        self.assert_previous_preserved()
        self.assertFalse((self.root / 'escaped').exists())

    def test_old_release_survives_until_running_editor_exits(self):
        active = self.root / ('release-' + '3' * 40)
        active.mkdir()
        shutil.copy2('/usr/bin/sleep', active / 'code')
        process = subprocess.Popen([str(active / 'code'), '60'])
        try:
            updater.prune()
            self.assertTrue(active.is_dir())
        finally:
            process.terminate()
            process.wait(timeout=5)
        updater.prune()
        self.assertFalse(active.exists())
        self.assertEqual((self.root / 'current').resolve(), self.previous)


if __name__ == '__main__':
    unittest.main()

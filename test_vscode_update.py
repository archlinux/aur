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

    def test_abandoned_downloads_are_removed_without_following_symlinks(self):
        abandoned = self.root / '.update-interrupted'
        abandoned.mkdir()
        (abandoned / 'code.tar.gz').write_bytes(b'partial download')
        with tempfile.TemporaryDirectory(prefix='vscode-outside-') as outside:
            protected = Path(outside) / 'keep'
            protected.write_bytes(b'not updater data')
            link = self.root / '.update-link'
            link.symlink_to(outside)
            metadata = {
                'version': '1' * 40, 'sha256hash': '0' * 64,
                'url': 'https://vscode.download.prss.microsoft.com/test.tar.gz',
                'productVersion': 'test',
            }
            with patch.object(updater, 'fetch', return_value=io.BytesIO(json.dumps(metadata).encode())):
                updater.main()
            self.assertFalse(abandoned.exists())
            self.assertFalse(link.is_symlink())
            self.assertEqual(protected.read_bytes(), b'not updater data')
        self.assertEqual((self.root / 'current').resolve(), self.previous)

    def test_verified_release_replaces_current_and_removes_unused_previous(self):
        archive = io.BytesIO()
        with tarfile.open(fileobj=archive, mode='w:gz') as bundle:
            for name, data, mode in [
                ('bin/code', b'#!/bin/sh\nexit 0\n', 0o755),
                ('resources/app/product.json', json.dumps({'commit': '2' * 40}).encode(), 0o644),
            ]:
                member = tarfile.TarInfo('VSCode-linux-x64/' + name)
                member.mode = mode
                member.size = len(data)
                bundle.addfile(member, io.BytesIO(data))
        data = archive.getvalue()
        self.attempt(data, hashlib.sha256(data).hexdigest())
        installed = self.root / ('release-' + '2' * 40)
        self.assertEqual((self.root / 'current').resolve(), installed)
        self.assertEqual(
            json.loads((installed / 'resources/app/product.json').read_text())['commit'],
            '2' * 40,
        )
        self.assertFalse(self.previous.exists())
        self.assertFalse(list(self.root.glob('.update-*')))

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

    def test_inconclusive_process_snapshot_does_not_delete_releases(self):
        old = self.root / ('release-' + '3' * 40)
        old.mkdir()
        proc = self.root / 'proc'
        (proc / '123').mkdir(parents=True)
        # The PID was enumerated, but its executable disappeared during handoff.
        with patch.object(updater, 'Path', return_value=proc):
            updater.prune()
        self.assertTrue(old.is_dir())
        self.assertEqual((self.root / 'current').resolve(), self.previous)

    def test_non_editor_daemon_does_not_prevent_release_cleanup(self):
        old = self.root / ('release-' + '3' * 40)
        old.mkdir()
        proc = self.root / 'proc'
        daemon = proc / '123'
        daemon.mkdir(parents=True)
        (daemon / 'comm').write_text('gpg-agent\n')
        with patch.object(updater, 'Path', return_value=proc):
            updater.prune()
        self.assertFalse(old.exists())
        self.assertEqual((self.root / 'current').resolve(), self.previous)

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

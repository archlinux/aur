import importlib.machinery
import importlib.util
from pathlib import Path
import subprocess
import tempfile
import unittest
from unittest.mock import patch

loader = importlib.machinery.SourceFileLoader('launcher', str(Path(__file__).with_name('code')))
spec = importlib.util.spec_from_loader(loader.name, loader)
launcher = importlib.util.module_from_spec(spec)
loader.exec_module(launcher)

helper_loader = importlib.machinery.SourceFileLoader('directory_helper', str(Path(__file__).with_name('create-directory')))
helper_spec = importlib.util.spec_from_loader(helper_loader.name, helper_loader)
directory_helper = importlib.util.module_from_spec(helper_spec)
helper_loader.exec_module(directory_helper)


class FirstLaunchSafety(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(prefix='vscode-setup-test-')
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name) / 'vscode'

    def test_foreign_owner_is_not_taken_over(self):
        self.root.mkdir()
        marker = self.root / 'keep'
        marker.write_bytes(b'existing installation')
        uid = self.root.stat().st_uid
        with patch.object(launcher.os, 'getuid', return_value=uid + 1), patch.object(
            launcher.subprocess, 'run', side_effect=AssertionError('Unexpected setup command')
        ):
            with self.assertRaises(SystemExit):
                launcher.initialize(self.root)
        self.assertEqual(marker.read_bytes(), b'existing installation')
        self.assertFalse((self.root / '.initialized').exists())

    def test_symlink_is_not_followed_or_changed(self):
        target = Path(self.tmp.name) / 'other'
        target.mkdir()
        self.root.symlink_to(target)
        with patch.object(launcher.subprocess, 'run', side_effect=AssertionError('Unexpected setup command')):
            with self.assertRaises(SystemExit):
                launcher.initialize(self.root)
        self.assertTrue(self.root.is_symlink())
        self.assertEqual(list(target.iterdir()), [])

    def test_download_failure_is_not_marked_initialized(self):
        self.root.mkdir()
        with patch.object(launcher.subprocess, 'run', side_effect=subprocess.CalledProcessError(1, 'download')):
            with self.assertRaises(subprocess.CalledProcessError):
                launcher.initialize(self.root)
        self.assertFalse((self.root / '.initialized').exists())
        self.assertFalse((self.root / 'current').exists())

    def test_timer_failure_is_not_marked_initialized(self):
        installed = self.root / 'current/bin/code'
        installed.parent.mkdir(parents=True)
        installed.write_bytes(b'existing editor')
        with patch.object(launcher.subprocess, 'run', side_effect=[
            subprocess.CompletedProcess('reload', 0), subprocess.CalledProcessError(1, 'enable timer'),
        ]):
            with self.assertRaises(subprocess.CalledProcessError):
                launcher.initialize(self.root)
        self.assertFalse((self.root / '.initialized').exists())
        self.assertEqual(installed.read_bytes(), b'existing editor')


    def test_directory_created_during_authorization_is_not_changed(self):
        self.root.mkdir()
        marker = self.root / 'keep'
        marker.write_bytes(b'created by another invocation')
        with patch.object(directory_helper.os, 'chown', side_effect=AssertionError('Ownership takeover')):
            directory_helper.create_directory(self.root, self.root.stat().st_uid)
        self.assertEqual(marker.read_bytes(), b'created by another invocation')

    def test_symlink_created_during_authorization_is_rejected(self):
        target = Path(self.tmp.name) / 'other'
        target.mkdir()
        def authorize(*args, **kwargs):
            self.root.symlink_to(target)
        with patch.object(launcher.subprocess, 'run', side_effect=authorize):
            with self.assertRaises(SystemExit):
                launcher.initialize(self.root)
        self.assertTrue(self.root.is_symlink())
        self.assertEqual(list(target.iterdir()), [])


if __name__ == '__main__':
    unittest.main()

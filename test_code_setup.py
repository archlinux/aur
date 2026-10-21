import importlib.machinery
import importlib.util
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

loader = importlib.machinery.SourceFileLoader('launcher', str(Path(__file__).with_name('code')))
spec = importlib.util.spec_from_loader(loader.name, loader)
launcher = importlib.util.module_from_spec(spec)
loader.exec_module(launcher)


class LaunchSafety(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(prefix='vscode-launch-test-')
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name) / 'state'
        self.bundled = Path(self.tmp.name) / 'bundled'
        self.make_editor(self.bundled, 42)
        for name, value in [('ROOT', self.root), ('BUNDLED', self.bundled)]:
            setting = patch.object(launcher, name, value)
            setting.start()
            self.addCleanup(setting.stop)
        commands = patch.object(launcher.subprocess, 'run', side_effect=AssertionError(
            'Opening the editor must not request authorization, configure a timer or download'
        ))
        commands.start()
        self.addCleanup(commands.stop)

    def make_editor(self, path, status):
        (path / 'bin').mkdir(parents=True)
        (path / 'bin/code').touch()
        executable = path / 'code'
        executable.write_text(f'#!/bin/sh\nexit {status}\n')
        executable.chmod(0o755)

    def test_first_launch_needs_neither_state_directory_nor_authorization(self):
        self.assertEqual(launcher.main(), 42)
        self.assertFalse(self.root.exists())

    def test_system_state_is_read_only_for_the_desktop_user(self):
        self.root.mkdir()
        lock = self.root / '.update.lock'
        lock.touch(mode=0o444)
        (self.root / 'current').symlink_to(self.bundled)
        self.root.chmod(0o555)
        self.addCleanup(self.root.chmod, 0o755)
        self.assertEqual(launcher.main(), 42)
        self.assertEqual(lock.stat().st_mode & 0o777, 0o444)

    def test_updated_release_takes_precedence_over_bundled_editor(self):
        updated = Path(self.tmp.name) / 'updated'
        self.make_editor(updated, 43)
        self.root.mkdir()
        (self.root / '.update.lock').touch()
        (self.root / 'current').symlink_to(updated)
        self.assertEqual(launcher.main(), 43)

    def test_missing_current_release_still_opens_the_packaged_editor(self):
        self.root.mkdir()
        (self.root / '.update.lock').touch()
        (self.root / 'current').symlink_to(self.root / 'missing')
        self.assertEqual(launcher.main(), 42)


if __name__ == '__main__':
    unittest.main()

#!/usr/bin/env python3
"""Check package upgrades preserve user state and invalidate generated agents."""
import json
import hashlib
from pathlib import Path
import runpy
import tempfile
from types import SimpleNamespace
import unittest

wrapper = SimpleNamespace(**runpy.run_path(str(Path(__file__).with_name("high-tide"))))


class WorkspaceTest(unittest.TestCase):
    def test_retired_package_files_preserve_local_edits(self):
        with tempfile.TemporaryDirectory() as temporary:
            base = Path(temporary)
            source, destination = base / "installed", base / "workspace"
            files = ("old/unchanged.java", "old/edited.java")
            for name in files:
                path = source / "backend" / name
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text("old package content")
            digest = hashlib.sha256(b"old package content").hexdigest()
            manifest = source / "backend-manifest.json"
            manifest.write_text(json.dumps({name: {"sha256": digest} for name in files}))
            wrapper.provision(source, destination)
            (destination / files[1]).write_text("local edits")
            (destination / "user-data").write_text("keep me")
            manifest.write_text("{}")
            wrapper.provision(source, destination)
            self.assertFalse(any((destination / name).exists() for name in files))
            backups = list((destination / ".retired-package-files").rglob("edited.java"))
            self.assertEqual(len(backups), 1)
            self.assertEqual(backups[0].read_text(), "local edits")
            self.assertEqual((destination / "user-data").read_text(), "keep me")

    def test_upgrade_and_repeat(self):
        with tempfile.TemporaryDirectory() as temporary:
            base = Path(temporary)
            source, destination = base / "installed", base / "user workspace"
            script = source / "backend/scripts/run_native_loader.sh"
            script.parent.mkdir(parents=True)
            script.write_text("version one")
            script.chmod(0o755)
            manifest = source / "backend-manifest.json"
            manifest.write_text(json.dumps({"scripts/run_native_loader.sh": "one"}))
            wrapper.provision(source, destination)
            self.assertEqual((destination / "scripts/run_native_loader.sh").read_text(), "version one")
            self.assertTrue((destination / "scripts/run_native_loader.sh").stat().st_mode & 0o100)
            protected = ("dist/stage1/java/payload.jar", "wineprefix/user.reg", "hwid-serial.json",
                         "stage0/runs/capture.pcapng", "platform/loader/build/attach.log")
            for name in (*protected, "platform/loader/build/high-tide-loader.jar"):
                path = destination / name
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text("user data")
            wrapper.provision(source, destination)
            self.assertTrue((destination / "platform/loader/build/high-tide-loader.jar").exists())
            script.write_text("version two")
            manifest.write_text(json.dumps({"scripts/run_native_loader.sh": "two"}))
            wrapper.provision(source, destination)
            self.assertEqual((destination / "scripts/run_native_loader.sh").read_text(), "version two")
            self.assertFalse((destination / "platform/loader/build/high-tide-loader.jar").exists())
            for name in protected:
                self.assertEqual((destination / name).read_text(), "user data")


if __name__ == "__main__":
    unittest.main()

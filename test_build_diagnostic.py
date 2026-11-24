import os
import pathlib
import subprocess
import tempfile
import unittest

RECIPE = pathlib.Path(__file__).resolve().parent / "PKGBUILD"


class FlutterBuildDiagnosticTest(unittest.TestCase):
    def run_case(self, mode):
        with tempfile.TemporaryDirectory(
            prefix="neo-build-retry-", dir=os.environ.get("TMPDIR")
        ) as name:
            root = pathlib.Path(name)
            fake = root / "flutter"
            fake.write_text("""#!/bin/sh
count=0
[ ! -f "$FIXTURE/count" ] || read -r count < "$FIXTURE/count"
count=$((count + 1))
printf '%s\\n' "$count" > "$FIXTURE/count"
if [ "$MODE" = fatal ]; then printf 'real failure\\n'; exit 7; fi
if [ "$MODE" = repeat ] || { [ "$MODE" = once ] && [ "$count" = 1 ]; }; then
  printf 'ERROR: File modified during build. Build must be rerun.\\n'
else
  printf 'Built native bundle\\n'
fi
""")
            fake.chmod(0o755)
            env = {
                **os.environ,
                "PATH": str(root) + ":/usr/bin",
                "FIXTURE": str(root),
                "MODE": mode,
                "RECIPE": str(RECIPE),
            }
            result = subprocess.run(
                ["bash", "-c", 'source "$RECIPE"; srcdir="$FIXTURE"; _build_linux'],
                env=env,
                capture_output=True,
                text=True,
                timeout=15,
            )
            count = (
                int((root / "count").read_text()) if (root / "count").exists() else 0
            )
            return result.returncode, count

    def test_normal_success_runs_once(self):
        self.assertEqual(self.run_case("ok"), (0, 1))

    def test_exact_zero_exit_warning_requires_second_success(self):
        self.assertEqual(self.run_case("once"), (0, 2))

    def test_repeated_warning_fails_after_two_attempts(self):
        status, count = self.run_case("repeat")
        self.assertNotEqual(status, 0)
        self.assertEqual(count, 2)

    def test_real_failure_is_not_retried(self):
        status, count = self.run_case("fatal")
        self.assertNotEqual(status, 0)
        self.assertEqual(count, 1)


if __name__ == "__main__":
    unittest.main()

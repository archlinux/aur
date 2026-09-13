"""Exercise account selection without a display, clipboard or LastPass account."""

import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest


PROGRAM = Path(sys.argv.pop(1)).resolve()


class SelectionTests(unittest.TestCase):
    def run_selection(self, selection):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            commands = {
                "lpass": '''#!/bin/bash
set -eu
if [[ $1 == ls ]]; then
    [[ $2 == --format && $3 == "%ai %an %au" ]]
    printf '%s\\n' '123 Personal Mail alice@example.org' '456 Work Mail bob@example.org'
else
    printf '%s\\n' "$@" > "$RESULT"
fi
''',
                "dmenu": '''#!/bin/bash
set -eu
[[ $# == 3 && $1 == -i && $2 == -p && $3 == Account ]]
sort > "$MENU"
printf '%s\\n' "$SELECTION"
''',
            }
            for name, content in commands.items():
                path = root / name
                path.write_text(content)
                path.chmod(0o755)
            environment = dict(os.environ, PATH=f"{root}:/usr/bin", SELECTION=selection,
                               MENU=str(root / "menu"), RESULT=str(root / "result"))
            # capture_output waits for the background lpass child to close its pipes.
            subprocess.run(["bash", str(PROGRAM)], env=environment, check=True,
                           capture_output=True, text=True, timeout=10)
            self.assertEqual((root / "menu").read_text().splitlines(),
                             ["Personal Mail alice@example.org", "Work Mail bob@example.org"])
            result = root / "result"
            return result.read_text().splitlines() if result.exists() else None

    def test_account_with_spaces(self):
        self.assertEqual(self.run_selection("Work Mail bob@example.org"),
                         ["show", "-c", "--password", "456"])

    def test_cancel_does_not_request_password(self):
        self.assertIsNone(self.run_selection(""))


if __name__ == "__main__":
    unittest.main()

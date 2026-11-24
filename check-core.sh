# Run from a scratch directory outside the unpacked source tree.
set -eu
source_dir=$1
python -m venv --without-pip --system-site-packages venv
venv/bin/python -m installer --overwrite-existing "$source_dir"/dist/*.whl

python_bin=$PWD/venv/bin/python
(
  cd "$source_dir"
  # Use the installed distribution even while pytest reads the sdist's config.
  "$python_bin" -I - <<'PYTHON'
import sys
from pathlib import Path

import kara_templater

assert Path(kara_templater.__file__).resolve().is_relative_to(sys.prefix)
PYTHON
  "$python_bin" -I -m pytest -q -p no:cacheprovider
)

venv/bin/kara-templater "$source_dir/examples/karaoke.ass" output.ass --ass
grep -q '^Dialogue:' output.ass
venv/bin/python -I - <<'PY'
from pathlib import Path
from kara_templater import Document, Lifetime, Scene, TextObject

scene = Scene(Document.create(width=96, height=64))
scene.add(TextObject(id="lyric", text="A", lifetime=Lifetime(0, 1)))
path = Path("lyric.hook")
scene.export(path, fps=10)
assert "//!HOOK MAIN" in path.read_text()
PY

# Run from a scratch directory outside the unpacked source tree.
set -eu
source_dir=$1
python -m venv --without-pip --system-site-packages venv
venv/bin/python -m installer --overwrite-existing "$source_dir"/dist/*.whl

tests="$source_dir/tests"
venv/bin/python -I -m pytest -q -p no:cacheprovider \
  "$tests/test_fonts.py::test_registered_resources_leave_font_selection_to_each_style" \
  "$tests/test_import_ass.py::test_timing_tags_offsets_static_prefix_and_ruby_continuation" \
  "$tests/test_structured_lyrics.py::test_structured_literal_text_repeats_ruby_and_precision_survive_without_records" \
  "$tests/test_structured_lyrics.py::test_structured_cue_uses_same_measurement_and_occupancy" \
  "$tests/test_lyric_layout.py::test_two_rows_trim_optional_windows_without_moving_singing" \
  "$tests/test_raster.py::test_pixel_geometry_has_exact_position_and_no_adjacent_seams" \
  "$tests/test_gpu_scene.py::test_gpu_scene_keeps_clocks_and_reuses_coverage_after_seek"

venv/bin/kara-templater "$source_dir/examples/karaoke.ass" output.ass
grep -q '^Dialogue:' output.ass
venv/bin/python -I - <<'PY'
from pathlib import Path
from kara_templater import Document, Lifetime, Scene, TextObject

scene = Scene(Document.create(width=96, height=64))
scene.add(TextObject(id="lyric", text="A", lifetime=Lifetime(0, 1)))
path = Path("lyric.hook")
scene.export_hook(path, fps=10)
assert "//!HOOK MAIN" in path.read_text()
PY

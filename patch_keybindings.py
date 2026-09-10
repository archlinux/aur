#!/usr/bin/env python3
"""Fail-safe editor/model/queue keybinding rotation for Factory Droid.

Rotates three interactive shortcuts without changing binary size:
  * open in editor:        Ctrl-P -> Ctrl-G
  * cycle model:           Ctrl-N -> Ctrl-P
  * pull queued messages:  Ctrl-G -> Ctrl-Q

The serialized keymap table, the guarded runtime dispatch statements, the
model registry matcher, and every human-readable chord hint (``Ctrl+P``,
``Ctrl + P``, ``ctrl+N``, ... and the matching N/G variants across locales)
are rotated together. Optional-callback availability guards travel with
their action, so the editor stays unguarded on Ctrl-G while the queue pull
keeps its guard on Ctrl-Q. Machine kebab-case keys (``ctrl-g``) and the
key-name registry are never rewritten. Minified identifier names may change
between releases; unknown, ambiguous, or partially patched layouts fail
closed.
"""

import argparse
import re
import shutil
import subprocess
import sys
from pathlib import Path


class PatchError(RuntimeError):
    """Raised when the binary is not a known safe patch target."""


TABLE_RE = re.compile(
    rb"ctrl-g\x00.{0,128}?(?P<queue_action>[A-Za-z_$][A-Za-z0-9_$]{0,7})\x00"
    rb".{0,2000}?(?P<editor_key>ctrl-p|ctrl-q)\x00.{0,128}?"
    rb"(?P<editor_action>[A-Za-z_$][A-Za-z0-9_$]{0,7})\x00.{0,2000}?"
    rb"ctrl-slash\x00.{0,2000}?model-cycle\x00.{0,2000}?autonomy-cycle\x00",
    re.DOTALL,
)
DISPATCH_LOCAL_RE = re.compile(
    rb'[A-Za-z_$][A-Za-z0-9_$]*\([^;]{0,100}?"(?P<key>ctrl-[gnpq])"\)'
    rb"(?P<guard>&&[A-Za-z_$][A-Za-z0-9_$]{0,7})?"
    rb'[^;]{0,100}?return (?P<action>[A-Za-z_$][A-Za-z0-9_$]*)\(\),!0;'
)
MODEL_CYCLE_RE = re.compile(
    rb'modelCycle:\{id:"model-cycle",label:"Ctrl\+[NP]",'
    rb'matcher:\((?P<mparam>[A-Za-z_$][A-Za-z0-9_$]{0,7})\)=>'
    rb'[A-Za-z_$][A-Za-z0-9_$]{0,7}\((?P=mparam),"[np]"\)\}'
)
DISPLAY_REPLACEMENTS = (
    (b"Ctrl + P", b"Ctrl + G"),
    (b"Ctrl+P", b"Ctrl+G"),
    (b"ctrl+P", b"ctrl+G"),
    (b"Ctrl-P", b"Ctrl-G"),
    (b"Ctrl + N", b"Ctrl + P"),
    (b"Ctrl+N", b"Ctrl+P"),
    (b"ctrl+N", b"ctrl+P"),
    (b"Ctrl-N", b"Ctrl-P"),
    (b"Ctrl + G", b"Ctrl + Q"),
    (b"Ctrl+G", b"Ctrl+Q"),
    (b"ctrl+G", b"ctrl+Q"),
    (b"Ctrl-G", b"Ctrl-Q"),
)
DISPLAY_MAP = dict(DISPLAY_REPLACEMENTS)
DISPLAY_RE = re.compile(b"|".join(re.escape(before) for before, _ in DISPLAY_REPLACEMENTS))


def _find_keymap(data: bytes) -> re.Match[bytes]:
    """Locate the one serialized keymap whose actions the dispatch confirms."""
    matches = []
    offset = 0
    while True:
        position = data.find(b"ctrl-g\x00", offset)
        if position == -1:
            break
        match = TABLE_RE.match(data, position)
        if match:
            matches.append(match)
        offset = position + 1
    candidates = []
    for match in matches:
        queue_action = match.group("queue_action")
        editor_action = match.group("editor_action")
        editor_key = match.group("editor_key")
        if editor_key == b"ctrl-p":
            valid = _dispatch_matches(data, b"ctrl-g", queue_action) and _dispatch_matches(
                data, editor_key, editor_action
            )
        else:
            valid = _dispatch_matches(data, b"ctrl-g", queue_action) and _dispatch_matches(
                data, b"ctrl-q", editor_action
            )
        if valid:
            candidates.append(match)
    if len(candidates) == 1:
        return candidates[0]
    if not candidates and matches:
        raise PatchError("keymap present but dispatch cross-validation failed (partially patched or unknown)")
    raise PatchError(f"expected one keymap, found {len(candidates)}")


def _dispatch_matches(
    data: bytes, key: bytes, action: bytes | None = None
) -> list[tuple[int, int, re.Match[bytes]]]:
    """All dispatch statements bound to ``key`` (optionally calling ``action``).

    Statements are searched in windows around each quoted key occurrence and
    returned as (absolute_start, absolute_end, match) triples, so counts
    reflect every statement that key can reach.
    """
    marker = b'"' + key + b'"'
    found: list[tuple[int, int, re.Match[bytes]]] = []
    offset = 0
    while True:
        position = data.find(marker, offset)
        if position == -1:
            return found
        window_start = max(0, position - 140)
        window_end = min(len(data), position + 180)
        for match in DISPATCH_LOCAL_RE.finditer(data[window_start:window_end]):
            if match.group("key") != key:
                continue
            if action is not None and match.group("action") != action:
                continue
            found.append((window_start + match.start(), window_start + match.end(), match))
        offset = position + 1


def apply_patch_bytes(data: bytes) -> bytes:
    """Rotate editor/model/queue bindings, refusing unknown layouts."""
    keymap_match = _find_keymap(data)
    start, end = keymap_match.span()
    keymap = keymap_match.group(0)
    queue_action = keymap_match.group("queue_action")
    editor_key = keymap_match.group("editor_key")
    editor_action = keymap_match.group("editor_action")
    if editor_key == b"ctrl-q":
        # Already-rotated table: normalize the names back to their actions.
        queue_action, editor_action = editor_action, queue_action
    if len(queue_action) != len(editor_action):
        raise PatchError("keybinding action names have different byte lengths")
    model_cycle = list(MODEL_CYCLE_RE.finditer(data))

    if editor_key == b"ctrl-q":
        # Already-rotated (or partially rotated) layout: accept it only when it
        # is byte-for-byte the state this patcher produces.
        if len(model_cycle) != 1 or not model_cycle[0].group(0).endswith(b',"p")}'):
            raise PatchError("keymap is partially patched or has an unknown model registry")
        dispatch_g = _dispatch_matches(data, b"ctrl-g", editor_action)
        dispatch_n = _dispatch_matches(data, b"ctrl-q", queue_action)
        if (
            len(dispatch_g) == 1
            and dispatch_g[0][2].group("guard") is None
            and len(dispatch_n) == 1
            and dispatch_n[0][2].group("guard") == b"&&" + queue_action
        ):
            return data
        raise PatchError("keymap is partially patched or has an unknown Ctrl-G/Ctrl-Q layout")

    dispatch_g = _dispatch_matches(data, b"ctrl-g", queue_action)
    dispatch_p = _dispatch_matches(data, b"ctrl-p", editor_action)
    dispatch_g_any = _dispatch_matches(data, b"ctrl-g")
    dispatch_p_any = _dispatch_matches(data, b"ctrl-p")
    dispatch_n_any = _dispatch_matches(data, b"ctrl-q")
    if (
        len(dispatch_g) != 1
        or len(dispatch_p) != 1
        or len(dispatch_g_any) != 1
        or len(dispatch_p_any) != 1
        or len(model_cycle) != 1
    ):
        raise PatchError("expected one unique Ctrl-G, Ctrl-P, and Ctrl-Q action")
    if dispatch_n_any:
        raise PatchError("upstream already binds Ctrl-Q inline; refusing to rotate")

    g_start, g_end, g_match = dispatch_g[0]
    p_start, p_end, p_match = dispatch_p[0]
    # The queue action is an optional callback guarded by its own identifier
    # (upstream: `if(mf(...,"ctrl-g")&&GH&&!tD&&!KI)return GH(),!0;` because GH
    # is absent when there is nothing to pull). Guards gate the action, not
    # the key, so they must travel with the action during the rotation.
    if g_match.group("guard") != b"&&" + queue_action:
        raise PatchError("queue dispatch is missing its action guard")
    if p_match.group("guard") is not None:
        raise PatchError("editor dispatch carries an unexpected action guard")
    if not g_start < p_start or p_start - g_end > 16 or b";" in data[g_end:p_start]:
        raise PatchError("queue and editor dispatch statements are not adjacent")

    g_stmt = g_match.group(0)
    p_stmt = p_match.group(0)
    guard_start = g_match.start("guard") - g_match.start()
    guard_end = g_match.end("guard") - g_match.start()
    new_g = g_stmt[:guard_start] + g_stmt[guard_end:]
    new_g = new_g.replace(queue_action + b"()", editor_action + b"()", 1)
    key_anchor = b'"ctrl-p")'
    insert_at = p_stmt.index(key_anchor) + len(key_anchor)
    new_p = p_stmt[:insert_at] + b"&&" + queue_action + p_stmt[insert_at:]
    new_p = new_p.replace(b'"ctrl-p"', b'"ctrl-q"', 1)
    new_p = new_p.replace(editor_action + b"()", queue_action + b"()", 1)
    dispatch_replacement = new_g + data[g_end:p_start] + new_p
    if len(dispatch_replacement) != p_end - g_start:
        raise PatchError("dispatch rotation changed binary size")

    model_replacement = model_cycle[0].group(0).replace(b'"n"', b'"p"', 1)

    # Rotate the serialized table: the editor action moves under ctrl-g and
    # the editor entry itself becomes the queue entry on ctrl-q.
    ctrl_g_entry = re.search(
        rb"ctrl-g\x00.{0,128}?" + re.escape(queue_action) + rb"\x00", keymap, re.DOTALL
    )
    if not ctrl_g_entry:
        raise PatchError("keymap entry for Ctrl-G is missing or ambiguous")
    patched_keymap = (
        keymap[: ctrl_g_entry.start()]
        + ctrl_g_entry.group(0).replace(queue_action + b"\x00", editor_action + b"\x00")
        + keymap[ctrl_g_entry.end() :]
    )
    ctrl_p_entry = re.search(
        re.escape(editor_key) + rb"\x00.{0,128}?" + re.escape(editor_action) + rb"\x00",
        patched_keymap,
        re.DOTALL,
    )
    if not ctrl_p_entry:
        raise PatchError("keymap entry for the editor key is missing or ambiguous")
    patched_keymap = (
        patched_keymap[: ctrl_p_entry.start()]
        + ctrl_p_entry.group(0).replace(editor_key, b"ctrl-q").replace(
            editor_action + b"\x00", queue_action + b"\x00"
        )
        + patched_keymap[ctrl_p_entry.end() :]
    )
    if len(patched_keymap) != len(keymap):
        raise PatchError("keymap replacement changed binary size")

    spans = sorted([(start, end), (g_start, p_end), model_cycle[0].span()])
    if not (spans[0][1] <= spans[1][0] and spans[1][1] <= spans[2][0]):
        raise PatchError("keybinding patch targets overlap")

    patched = bytearray(data)
    patched[start:end] = patched_keymap
    patched[g_start:p_end] = dispatch_replacement
    mc_start, mc_end = model_cycle[0].span()
    patched[mc_start:mc_end] = model_replacement

    def replace_display(match: re.Match[bytes]) -> bytes:
        return DISPLAY_MAP[match.group(0)]

    patched = bytearray(DISPLAY_RE.sub(replace_display, bytes(patched)))
    if len(patched) != len(data):
        raise PatchError("keybinding rotation changed binary size")
    return bytes(patched)


def apply_patch(
    src_path: Path, dest_path: Path | None = None, dry_run: bool = False, test: bool = False
) -> bool:
    data = src_path.read_bytes()
    try:
        patched = apply_patch_bytes(data)
    except PatchError as error:
        print(f"error: {error}", file=sys.stderr)
        return False

    if dry_run:
        if patched == data:
            print("[dry-run] Binary already has the keybinding rotation.")
        else:
            print("[dry-run] Editor/model/queue keybinding rotation would be applied.")
        return True

    target = dest_path or src_path
    if patched == data:
        print(f"Notice: '{src_path}' already has the keybinding rotation.")
        if dest_path and dest_path != src_path:
            shutil.copy2(src_path, dest_path)
    else:
        tmp_path = target.with_suffix(".tmp_keybindings")
        tmp_path.write_bytes(patched)
        tmp_path.chmod(0o755)
        tmp_path.replace(target)
        print(f"Successfully applied editor/model/queue keybinding rotation to '{target}'.")

    if test:
        result = subprocess.run(
            [str(target.resolve()), "--version"],
            capture_output=True,
            text=True,
            timeout=10,
            check=False,
        )
        if result.returncode != 0 or not result.stdout.strip():
            print(f"error: smoke test failed for '{target}'", file=sys.stderr)
            return False
        print(f"Smoke test PASSED: '{target.name} --version' reported {result.stdout.strip()}")
    return True


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("binary", type=Path)
    parser.add_argument("--dest", type=Path)
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--test", action="store_true")
    args = parser.parse_args()
    return 0 if apply_patch(args.binary, args.dest, args.dry_run, args.test) else 1


if __name__ == "__main__":
    sys.exit(main())

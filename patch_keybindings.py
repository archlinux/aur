#!/usr/bin/env python3
"""Fail-safe editor/model/queue keybinding rotation for Factory Droid.

Rotates three interactive shortcuts without changing binary size:
  * open in editor:        Ctrl-P -> Ctrl-G
  * cycle model:           Ctrl-N -> Ctrl-P
  * pull queued messages:  Ctrl-G -> Ctrl-I

The serialized keymap table, the guarded runtime dispatch statements, the
runtime key descriptor registry, the model registry matcher, and every
human-readable chord hint (``Ctrl+P``, ``Ctrl + P``, ``ctrl+N``, ... and the
matching N/G variants across locales) are rotated together. Optional-callback
availability guards travel with their action, so the editor stays unguarded
on Ctrl-G while the queue pull keeps its guard on Ctrl-I. Machine kebab-case
keys (``ctrl-g``) outside the validated keymap are never rewritten. Minified
identifier names may change between releases; unknown, ambiguous, or
partially patched layouts fail closed.
"""

import argparse
import re
import shutil
import struct
import subprocess
import sys
from pathlib import Path


class PatchError(RuntimeError):
    """Raised when the binary is not a known safe patch target."""


TABLE_RE = re.compile(
    rb"ctrl-g\x00.{0,128}?(?P<queue_action>[A-Za-z_$][A-Za-z0-9_$]{0,7})\x00"
    rb".{0,2000}?(?P<editor_key>ctrl-p|ctrl-i)\x00.{0,128}?"
    rb"(?P<editor_action>[A-Za-z_$][A-Za-z0-9_$]{0,7})\x00.{0,2000}?"
    rb"ctrl-slash\x00.{0,2000}?model-cycle\x00.{0,2000}?autonomy-cycle\x00",
    re.DOTALL,
)
DISPATCH_LOCAL_RE = re.compile(
    rb'[A-Za-z_$][A-Za-z0-9_$]*\([^;]{0,100}?"(?P<key>ctrl-[gipq])"\)'
    rb"(?P<guard>&&[A-Za-z_$][A-Za-z0-9_$]{0,7})?"
    rb'[^;]{0,100}?return (?P<action>[A-Za-z_$][A-Za-z0-9_$]*)\(\),!0;'
)
MODEL_CYCLE_RE = re.compile(
    rb'modelCycle:\{id:"model-cycle",label:"Ctrl\+(?P<mlabel>[NP])",'
    rb'matcher:\((?P<mparam>[A-Za-z_$][A-Za-z0-9_$]{0,7})\)=>'
    rb'[A-Za-z_$][A-Za-z0-9_$]{0,7}\((?P=mparam),"(?P<mkey>[np])"\)\}'
)
RUNTIME_KEY_MAP_RE = re.compile(
    rb"\{[^{}]{0,500}"
    rb'(?P<key>p:"ctrl-p"|i:"ctrl-i")[^{}]{0,500}'
    rb"\}"
)
RUNTIME_DESCRIPTOR_RE = re.compile(
    rb"(?P<property>ctrlP|ctrlI):(?P<fn>[A-Za-z_$][A-Za-z0-9_$.]*?)\(\"(?P<letter>p|i)\"(?P<extra>[^)]*)\)"
)
RANGE_GAP = b"\xde\xadRANGE_GAP\xad\xde"
BINARY_RECORD_KEYMAP_WINDOW = 4096
RECORD_HEADER_TAIL_LEN = 7
DISPLAY_REPLACEMENTS = (
    (b"Ctrl + P", b"Ctrl + G"),
    (b"Ctrl+P", b"Ctrl+G"),
    (b"ctrl+P", b"ctrl+G"),
    (b"Ctrl-P", b"Ctrl-G"),
    (b"Ctrl + N", b"Ctrl + P"),
    (b"Ctrl+N", b"Ctrl+P"),
    (b"ctrl+N", b"ctrl+P"),
    (b"Ctrl-N", b"Ctrl-P"),
    (b"Ctrl + G", b"Ctrl + I"),
    (b"Ctrl+G", b"Ctrl+I"),
    (b"ctrl+G", b"ctrl+I"),
    (b"Ctrl-G", b"Ctrl-I"),
)
DISPLAY_MAP = dict(DISPLAY_REPLACEMENTS)
DISPLAY_RE = re.compile(b"|".join(re.escape(before) for before, _ in DISPLAY_REPLACEMENTS))


def _ensure_disjoint_spans(spans: list[tuple[int, int]]) -> None:
    ordered = sorted(spans)
    if any(left[1] > right[0] for left, right in zip(ordered, ordered[1:])):
        raise PatchError("keybinding patch targets overlap")


def _record_header_re(key: bytes) -> re.Pattern[bytes]:
    return re.compile(re.escape(key) + rb"\x00{1,3}[^\x00]\x00\x00\x80")


def _find_binary_record_keymap(data: bytes, patched: bool) -> tuple[int, int, int] | None:
    """Find the newer keymap whose entries carry binary records instead of actions."""
    first_key, second_key = (b"ctrl-i", b"ctrl-g") if patched else (b"ctrl-g", b"ctrl-p")
    first_re = _record_header_re(first_key)
    second_re = _record_header_re(second_key)
    candidates = []
    for first_match in first_re.finditer(data):
        first_position = first_match.start()
        window_end = min(len(data), first_position + BINARY_RECORD_KEYMAP_WINDOW)
        window = data[first_position:window_end]
        second_match = second_re.search(window, RECORD_HEADER_TAIL_LEN)
        slash_position = window.find(b"ctrl-slash\x00", RECORD_HEADER_TAIL_LEN)
        model_position = window.find(b"model-cycle\x00", RECORD_HEADER_TAIL_LEN)
        autonomy_position = window.find(b"autonomy-cycle\x00", RECORD_HEADER_TAIL_LEN)
        if (
            second_match
            and slash_position > second_match.start()
            and model_position > slash_position
            and autonomy_position > model_position
            and RANGE_GAP not in window[:autonomy_position]
        ):
            candidates.append(
                (
                    first_position,
                    first_position + second_match.start(),
                    first_position + autonomy_position,
                )
            )
    if len(candidates) > 1:
        raise PatchError("expected one binary-record keymap, found multiple")
    return candidates[0] if candidates else None


def _find_binary_model_key(data: bytes, keymap: tuple[int, int, int], key: bytes) -> int:
    """Find the one binary-record keymap entry for the model-cycle binding."""
    first_position, _, autonomy_position = keymap
    model_re = _record_header_re(key)
    candidates = [m.start() for m in model_re.finditer(data, first_position, autonomy_position)]
    if RANGE_GAP in data[first_position:autonomy_position]:
        raise PatchError("binary-record keymap crosses an unknown range gap")
    if len(candidates) != 1:
        raise PatchError("expected one binary-record model key")
    return candidates[0]


def _model_cycle_matches(data: bytes) -> list[re.Match[bytes]]:
    return [match for match in MODEL_CYCLE_RE.finditer(data) if RANGE_GAP not in match.group(0)]


def _patch_runtime_key_registry(data: bytes) -> bytes:
    """Make the generic key-ID registry agree with the rotated dispatch."""
    key_maps = [
        match
        for match in RUNTIME_KEY_MAP_RE.finditer(data)
        if b'b:"ctrl-b"' in match.group(0)
        and b'c:"ctrl-c"' in match.group(0)
        and b'x:"ctrl-x"' in match.group(0)
        and b'z:"ctrl-z"' in match.group(0)
        and RANGE_GAP not in match.group(0)
    ]
    descriptors = [
        match
        for match in RUNTIME_DESCRIPTOR_RE.finditer(data)
        if RANGE_GAP not in match.group(0)
    ]
    old_maps = [match for match in key_maps if match.group("key") == b'p:"ctrl-p"']
    new_maps = [match for match in key_maps if match.group("key") == b'i:"ctrl-i"']
    old_descriptors = [
        match
        for match in descriptors
        if match.group("property") == b"ctrlP" and match.group("letter") == b"p"
    ]
    new_descriptors = [
        match
        for match in descriptors
        if match.group("property") == b"ctrlI" and match.group("letter") == b"i"
    ]

    if len(old_maps) == len(old_descriptors) == 1 and not new_maps and not new_descriptors:
        if abs(old_maps[0].start() - old_descriptors[0].start()) > 8192:
            raise PatchError("runtime key registry components are too far apart")
        replacements = [
            (old_maps[0].start("key"), old_maps[0].end("key"), b'i:"ctrl-i"'),
            (old_descriptors[0].start("property"), old_descriptors[0].end("property"), b"ctrlI"),
            (old_descriptors[0].start("letter"), old_descriptors[0].end("letter"), b"i"),
        ]
    elif len(new_maps) == len(new_descriptors) == 1 and not old_maps and not old_descriptors:
        if abs(new_maps[0].start() - new_descriptors[0].start()) > 8192:
            raise PatchError("runtime key registry components are too far apart")
        return data
    elif key_maps or descriptors:
        raise PatchError("runtime key registry is ambiguous or partially patched")
    else:
        raise PatchError("expected one runtime key registry")

    _ensure_disjoint_spans([(start, end) for start, end, _ in replacements])
    patched = bytearray(data)
    for start, end, replacement in replacements:
        if end - start != len(replacement):
            raise PatchError("runtime key registry replacement changed binary size")
        patched[start:end] = replacement
    return bytes(patched)


def _apply_binary_record_patch(data: bytes, keymap: tuple[int, int, int]) -> bytes:
    """Rotate the v0.219 keymap and its direct runtime dispatch statements."""
    queue_key_start, editor_key_start, _ = keymap
    patched = data[queue_key_start : queue_key_start + len(b"ctrl-i")] == b"ctrl-i"
    model_key = _find_binary_model_key(data, keymap, b"ctrl-p" if patched else b"ctrl-n")
    model_cycle = _model_cycle_matches(data)
    dispatch_g = _dispatch_matches(data, b"ctrl-g")
    dispatch_p = _dispatch_matches(data, b"ctrl-p")
    dispatch_i = _dispatch_matches(data, b"ctrl-i")

    if len(model_cycle) != 1:
        raise PatchError("binary-record keymap has an unknown model registry")

    model_match = model_cycle[0]
    if len(dispatch_g) == 1 and len(dispatch_i) == 1 and not dispatch_p:
        if (
            dispatch_g[0][2].group("guard") is None
            and dispatch_i[0][2].group("guard") == b"&&" + dispatch_i[0][2].group("action")
            and model_match.group("mlabel") == b"P"
            and model_match.group("mkey") == b"p"
        ):
            _ensure_disjoint_spans(
                [
                    (queue_key_start, queue_key_start + len(b"ctrl-i")),
                    (editor_key_start, editor_key_start + len(b"ctrl-g")),
                    (model_key, model_key + len(b"ctrl-p")),
                    (dispatch_g[0][0], dispatch_g[0][1]),
                    (dispatch_i[0][0], dispatch_i[0][1]),
                    model_match.span(),
                ]
            )
            return data
        raise PatchError("binary-record keymap is partially patched or has an unknown model registry")

    if len(dispatch_g) != 1 or len(dispatch_p) != 1 or dispatch_i:
        raise PatchError("expected one unique binary-record Ctrl-G and Ctrl-P action")
    g_start, g_end, g_match = dispatch_g[0]
    p_start, p_end, p_match = dispatch_p[0]
    if (
        g_match.group("guard") != b"&&" + g_match.group("action")
        or p_match.group("guard") is not None
    ):
        raise PatchError("binary-record dispatch has an unsafe action guard")
    if not g_start < p_start or p_start - g_end > 16 or b";" in data[g_end:p_start]:
        raise PatchError("binary-record dispatch statements are not adjacent")
    if model_match.group("mlabel") != b"N" or model_match.group("mkey") != b"n":
        raise PatchError("binary-record model registry is partially patched or unknown")
    _ensure_disjoint_spans(
        [
            (queue_key_start, queue_key_start + len(b"ctrl-g")),
            (editor_key_start, editor_key_start + len(b"ctrl-p")),
            (model_key, model_key + len(b"ctrl-n")),
            (g_start, p_end),
            model_match.span(),
        ]
    )

    g_stmt = g_match.group(0).replace(b'"ctrl-g"', b'"ctrl-i"', 1)
    p_stmt = p_match.group(0).replace(b'"ctrl-p"', b'"ctrl-g"', 1)
    dispatch_replacement = g_stmt + data[g_end:p_start] + p_stmt
    if len(dispatch_replacement) != p_end - g_start:
        raise PatchError("binary-record dispatch rotation changed binary size")

    patched = bytearray(data)
    patched[queue_key_start : queue_key_start + len(b"ctrl-g")] = b"ctrl-i"
    patched[editor_key_start : editor_key_start + len(b"ctrl-p")] = b"ctrl-g"
    patched[model_key : model_key + len(b"ctrl-n")] = b"ctrl-p"
    patched[g_start:p_end] = dispatch_replacement
    mc_start, mc_end = model_match.span()
    patched[mc_start:mc_end] = model_match.group(0).replace(b',"n")}', b',"p")}', 1)
    patched = bytearray(DISPLAY_RE.sub(lambda match: DISPLAY_MAP[match.group(0)], bytes(patched)))
    if len(patched) != len(data):
        raise PatchError("binary-record keybinding rotation changed binary size")
    return bytes(patched)


def _find_keymap(data: bytes) -> re.Match[bytes]:
    """Locate the one serialized keymap whose actions the dispatch confirms."""
    matches = []
    offset = 0
    while True:
        position = data.find(b"ctrl-g\x00", offset)
        if position == -1:
            break
        match = TABLE_RE.match(data, position)
        if match and RANGE_GAP not in match.group(0):
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
                data, b"ctrl-i", editor_action
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
            absolute_start = window_start + match.start()
            absolute_end = window_start + match.end()
            if RANGE_GAP in data[absolute_start:absolute_end]:
                continue
            if action is not None and match.group("action") != action:
                continue
            found.append((absolute_start, absolute_end, match))
        offset = position + 1


ELF_HEADER = struct.Struct("<16sHHIQQQIHHHHHH")
SECTION_HEADER = struct.Struct("<IIQQQQIIQQ")
JSC_CACHE_MAGIC = struct.pack("<I", 0xC33CCB8C)


def _invalidate_bun_bytecode_caches(original: bytes, patched: bytes) -> bytes:
    """For Bun standalone executables, invalidate precompiled bytecode for modified modules.

    Bun executes precompiled WebKit JavaScriptCore CachedBytecode rather than raw JS
    source text. When a module's JavaScript is patched, its precompiled bytecode cache
    must be invalidated (magic 0xc33ccb8c -> 0x00000000) and its recorded source hash
    must be zeroed so Bun falls back to compiling from our modified JavaScript source.
    """
    if len(patched) < ELF_HEADER.size or patched[:4] != b"\x7fELF":
        return patched

    header = ELF_HEADER.unpack_from(patched)
    section_offset = header[6]
    section_size = header[11]
    section_count = header[12]
    names_index = header[13]
    if (
        section_size != SECTION_HEADER.size
        or names_index >= section_count
        or section_offset + section_size * section_count > len(patched)
    ):
        return patched

    headers = [
        SECTION_HEADER.unpack_from(patched, section_offset + index * section_size)
        for index in range(section_count)
    ]
    names_offset = headers[names_index][4]
    names_size = headers[names_index][5]
    names = patched[names_offset : names_offset + names_size]
    sections = {}
    for name_offset, _, _, _, file_offset, size, _, _, _, _ in headers:
        name_end = names.find(b"\x00", name_offset)
        if name_end != -1:
            name = names[name_offset:name_end].decode("utf-8", "ignore")
            sections[name] = (file_offset, size)

    if ".bun" not in sections:
        return patched

    bun_off, bun_size = sections[".bun"]
    base = bun_off + 8
    tr = patched.rfind(b"\n---- Bun! ----\n")
    if tr == -1 or tr < 32:
        return patched

    byte_count, mo, ml, entry, ao, al, flags = struct.unpack_from("<QIIIIII", patched, tr - 32)
    rec_size = 52
    if ml % rec_size != 0 or base + mo + ml > len(patched):
        return patched

    num_modules = ml // rec_size
    hs_base = base + mo + ml
    if hs_base + num_modules * 4 > len(patched):
        return patched

    result = bytearray(patched)
    target_needle = b'modelCycle:{id:"model-cycle"'

    for i in range(num_modules):
        rec_offset = base + mo + i * rec_size
        vals = struct.unpack_from("<12I4B", patched, rec_offset)
        cont_off, cont_len = vals[2], vals[3]
        bc_off, bc_len = vals[6], vals[7]

        if cont_off + cont_len > len(patched) - base or bc_off + bc_len > len(patched) - base:
            continue

        orig_chunk = original[base + cont_off : base + cont_off + cont_len]
        new_chunk = patched[base + cont_off : base + cont_off + cont_len]

        if orig_chunk != new_chunk or target_needle in new_chunk:
            bc_abs = base + bc_off
            if bc_len >= 4 and result[bc_abs : bc_abs + 4] == JSC_CACHE_MAGIC:
                result[bc_abs : bc_abs + 4] = bytes(4)

            hash_slot = hs_base + i * 4
            result[hash_slot : hash_slot + 4] = bytes(4)

    return bytes(result)


def _apply_source_patch_bytes(data: bytes) -> bytes:
    """Rotate editor/model/queue bindings in JavaScript source text."""
    data = _patch_runtime_key_registry(data)
    binary_keymap = _find_binary_record_keymap(data, patched=False)
    if binary_keymap:
        return _apply_binary_record_patch(data, binary_keymap)
    patched_binary_keymap = _find_binary_record_keymap(data, patched=True)
    if patched_binary_keymap:
        return _apply_binary_record_patch(data, patched_binary_keymap)

    keymap_match = _find_keymap(data)
    start, end = keymap_match.span()
    keymap = keymap_match.group(0)
    queue_action = keymap_match.group("queue_action")
    editor_key = keymap_match.group("editor_key")
    editor_action = keymap_match.group("editor_action")
    if editor_key == b"ctrl-i":
        # Already-rotated table: normalize the names back to their actions.
        queue_action, editor_action = editor_action, queue_action
    if len(queue_action) != len(editor_action):
        raise PatchError("keybinding action names have different byte lengths")
    model_cycle = _model_cycle_matches(data)

    if editor_key == b"ctrl-i":
        # Already-rotated (or partially rotated) layout: accept it only when it
        # is byte-for-byte the state this patcher produces.
        if (
            len(model_cycle) != 1
            or model_cycle[0].group("mlabel") != b"P"
            or model_cycle[0].group("mkey") != b"p"
        ):
            raise PatchError("keymap is partially patched or has an unknown model registry")
        dispatch_g = _dispatch_matches(data, b"ctrl-g", editor_action)
        dispatch_n = _dispatch_matches(data, b"ctrl-i", queue_action)
        dispatch_p = _dispatch_matches(data, b"ctrl-p")
        if (
            len(dispatch_g) == 1
            and dispatch_g[0][2].group("guard") is None
            and len(dispatch_n) == 1
            and dispatch_n[0][2].group("guard") == b"&&" + queue_action
            and not dispatch_p
        ):
            return data
        raise PatchError("keymap is partially patched or has an unknown Ctrl-G/Ctrl-I layout")

    dispatch_g = _dispatch_matches(data, b"ctrl-g", queue_action)
    dispatch_p = _dispatch_matches(data, b"ctrl-p", editor_action)
    dispatch_g_any = _dispatch_matches(data, b"ctrl-g")
    dispatch_p_any = _dispatch_matches(data, b"ctrl-p")
    dispatch_n_any = _dispatch_matches(data, b"ctrl-i")
    if (
        len(dispatch_g) != 1
        or len(dispatch_p) != 1
        or len(dispatch_g_any) != 1
        or len(dispatch_p_any) != 1
        or len(model_cycle) != 1
    ):
        raise PatchError("expected one unique Ctrl-G, Ctrl-P, and Ctrl-I action")
    if dispatch_n_any:
        raise PatchError("upstream already binds Ctrl-I inline; refusing to rotate")
    if (
        len(model_cycle) != 1
        or model_cycle[0].group("mlabel") != b"N"
        or model_cycle[0].group("mkey") != b"n"
    ):
        raise PatchError("keymap has a partially patched or unknown model registry")

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
    new_p = new_p.replace(b'"ctrl-p"', b'"ctrl-i"', 1)
    new_p = new_p.replace(editor_action + b"()", queue_action + b"()", 1)
    dispatch_replacement = new_g + data[g_end:p_start] + new_p
    if len(dispatch_replacement) != p_end - g_start:
        raise PatchError("dispatch rotation changed binary size")

    model_replacement = model_cycle[0].group(0).replace(b'"n"', b'"p"', 1)

    # Rotate the serialized table: the editor action moves under ctrl-g and
    # the editor entry itself becomes the queue entry on ctrl-i.
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
        + ctrl_p_entry.group(0).replace(editor_key, b"ctrl-i").replace(
            editor_action + b"\x00", queue_action + b"\x00"
        )
        + patched_keymap[ctrl_p_entry.end() :]
    )
    if len(patched_keymap) != len(keymap):
        raise PatchError("keymap replacement changed binary size")

    _ensure_disjoint_spans([(start, end), (g_start, p_end), model_cycle[0].span()])

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


def apply_patch_bytes(data: bytes) -> bytes:
    """Rotate editor/model/queue bindings, refusing unknown layouts."""
    patched_source = _apply_source_patch_bytes(data)
    return _invalidate_bun_bytecode_caches(data, patched_source)


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
        print("Found keybinding rotation targets:")
        print("  Old: editor=Ctrl-P, model=Ctrl-N, queue=Ctrl-G")
        print("  New: editor=Ctrl-G, model=Ctrl-P, queue=Ctrl-I")
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

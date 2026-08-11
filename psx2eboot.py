#!/usr/bin/env python3
"""PSX2EBOOT - Convert PlayStation BIN/CUE images to PSP EBOOT.PBP files."""

from __future__ import annotations

import datetime as dt
import hashlib
import json
import os
import queue
import re
import shutil
import signal
import struct
import subprocess
import sys
import tempfile
import threading
import traceback
from dataclasses import dataclass, field
from pathlib import Path
from typing import Callable


APP_NAME = "PSX2EBOOT"
VERSION = "1.0.0"
IMAGE = "psx2eboot-pop-fe:latest"
POPFE_GIT = "https://github.com/sahlberg/pop-fe.git"
OUTPUT_SUFFIX = " [PS Vita EBOOT]"
PREFERRED_START_DIRECTORY = Path("/mnt/GAMES/EMUs/psx")

FILE_RE = re.compile(
    r'^\s*FILE\s+(?:"([^"]+)"|(.+?))\s+(BINARY|MOTOROLA|WAVE|AIFF|MP3)\s*$',
    re.IGNORECASE,
)
TRACK_RE = re.compile(r"^\s*TRACK\s+(\d+)\s+(\S+)\s*$", re.IGNORECASE)
INDEX_RE = re.compile(r"^\s*INDEX\s+(\d+)\s+(\d+):(\d+):(\d+)\s*$", re.IGNORECASE)
DISC_TOKEN_RE = re.compile(
    r"(?:[\s._-]*(?:disc|disk|cd|dvd)[\s._-]*(?:\d+|[ivx]+)|[\s._-]+d\d+)"
    r"(?:[\s._-]*(?:of|von)[\s._-]*\d+)?",
    re.IGNORECASE,
)
RELEASE_TAG_RE = re.compile(
    r"\s*[\[(](?:"
    r"USA|US|Europe|EU|Japan|Germany|France|Spain|Italy|Australia|World|Asia|Korea|"
    r"PAL|NTSC(?:-U|-J)?|Beta|Demo|Proto(?:type)?|Unl|Rev(?:ision)?\s*\w+|"
    r"v\d[^\])]*|[A-Z]{4}[-_ ]?\d{5}|"
    r"(?:En|De|Fr|Es|It|Ja|Pt|Nl|Sv|No|Da|Fi)(?:[, +]?(?:En|De|Fr|Es|It|Ja|Pt|Nl|Sv|No|Da|Fi))+"
    r")[\])]",
    re.IGNORECASE,
)
GENERIC_TITLES = {
    "cd",
    "disc",
    "disk",
    "game",
    "games",
    "image",
    "ps1",
    "playstation game",
    "psx",
    "rom",
    "roms",
    "track",
}


class ConversionError(RuntimeError):
    """A user-facing conversion error."""


class ConversionCancelled(ConversionError):
    """Raised when the user cancels a running conversion."""


@dataclass
class CueInfo:
    path: Path
    references: list[Path] = field(default_factory=list)
    audio_tracks: int = 0
    data_tracks: int = 0
    track_count: int = 0


@dataclass(frozen=True)
class ConversionPlan:
    source_dir: Path
    title: str
    output_dir: Path
    cues: tuple[Path, ...] = ()
    direct_image: Path | None = None


@dataclass(frozen=True)
class ConversionResult:
    status: str
    output_dir: Path
    game_id: str | None = None
    discs: int = 0
    tracks: int = 0
    audio_tracks: int = 0
    pbp_size: int = 0
    pbp_sha256: str = ""


@dataclass(frozen=True)
class BatchSummary:
    results: tuple[ConversionResult, ...]
    failures: tuple[tuple[Path, str], ...]
    log_path: Path | None


class Logger:
    def __init__(self, callback: Callable[[str], None] | None = None) -> None:
        self.callback = callback
        self.lines: list[str] = []

    def write(self, message: str = "") -> None:
        line = str(message).rstrip("\n")
        stamped = f"[{dt.datetime.now().strftime('%H:%M:%S')}] {line}"
        self.lines.append(stamped)
        if self.callback:
            self.callback(stamped)
        else:
            print(stamped, flush=True)

    def dump(self) -> str:
        return "\n".join(self.lines) + "\n"


def config_file() -> Path:
    base = Path(os.environ.get("XDG_CONFIG_HOME", Path.home() / ".config"))
    return base / "psx2eboot" / "config.json"


def state_directory() -> Path:
    base = Path(os.environ.get("XDG_STATE_HOME", Path.home() / ".local" / "state"))
    return base / "psx2eboot"


def load_last_directory() -> Path:
    try:
        data = json.loads(config_file().read_text(encoding="utf-8"))
        candidate = Path(data.get("last_directory", "")).expanduser()
        if candidate.is_dir():
            return candidate
    except (OSError, ValueError, TypeError):
        pass
    if PREFERRED_START_DIRECTORY.is_dir():
        return PREFERRED_START_DIRECTORY
    return Path.home()


def save_last_directory(path: Path) -> None:
    try:
        target = config_file()
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(
            json.dumps({"last_directory": str(path)}, indent=2) + "\n",
            encoding="utf-8",
        )
    except OSError:
        pass


def save_last_log(log: Logger, error: BaseException | None = None) -> Path | None:
    try:
        directory = state_directory()
        directory.mkdir(parents=True, exist_ok=True)
        target = directory / "last-run.log"
        content = log.dump()
        if error is not None:
            content += "\nERROR\n" + "".join(traceback.format_exception(error))
        target.write_text(content, encoding="utf-8")
        return target
    except OSError:
        return None


def safe_title(value: str) -> str:
    value = DISC_TOKEN_RE.sub("", value)
    value = re.sub(r"[\s._-]+(?:\d+\s*(?:of|von)\s*\d+)\s*$", "", value, flags=re.I)
    value = re.sub(r"\s+", " ", value).strip(" ._-[]()")
    return value or "PlayStation Game"


def clean_title(value: str) -> str:
    title = value.strip()
    if title.casefold().endswith(OUTPUT_SUFFIX.casefold()):
        title = title[: -len(OUTPUT_SUFFIX)].rstrip()
    title = RELEASE_TAG_RE.sub("", title)
    title = safe_title(title)
    title = re.sub(r"\s+", " ", title).strip(" ._-[]()")
    return title or "PlayStation Game"


def is_generic_title(value: str) -> bool:
    normalized = re.sub(r"[^a-z0-9]+", " ", value.casefold()).strip()
    return not normalized or normalized in GENERIC_TITLES or bool(
        re.fullmatch(r"(?:cd|disc|disk|track|image)\s*\d+", normalized)
    )


def choose_game_title(
    directory: Path,
    cues: list[Path],
    direct_image: Path | None = None,
) -> str:
    folder_title = clean_title(directory.name)
    media_title = ""
    if cues:
        media_title = clean_title(cues[0].stem)
    elif direct_image:
        media_title = clean_title(direct_image.stem)
    if is_generic_title(folder_title) and media_title:
        return media_title
    return folder_title or media_title or "PlayStation Game"


def disc_sort_key(path: Path) -> tuple[int, str]:
    match = re.search(r"(?:disc|disk|cd|dvd|\bd)[\s._-]*(\d+)", path.stem, re.I)
    return (int(match.group(1)) if match else 1, path.name.casefold())


def build_plan(source: Path, add_suffix: bool = True) -> ConversionPlan:
    source = source.expanduser()
    try:
        source = source.resolve(strict=True)
    except OSError as exc:
        raise ConversionError(f"The selected folder does not exist:\n{source}") from exc
    if not source.is_dir():
        raise ConversionError(f"The selected path is not a folder:\n{source}")

    folder_title = clean_title(source.name)
    early_output = source / (folder_title + (OUTPUT_SUFFIX if add_suffix else ""))
    # The normal case can be skipped without inspecting any source image.
    if early_output.exists():
        if not early_output.is_dir():
            raise ConversionError(f"The output path is blocked by a file:\n{early_output}")
        return ConversionPlan(source, folder_title, early_output)

    try:
        files = [path for path in source.iterdir() if path.is_file()]
    except OSError as exc:
        raise ConversionError(f"The selected folder cannot be read:\n{source}\n\n{exc}") from exc

    cues = sorted(
        (path for path in files if path.suffix.casefold() == ".cue"),
        key=disc_sort_key,
    )
    if cues:
        groups = {safe_title(path.stem).casefold() for path in cues}
        if len(groups) != 1:
            names = "\n".join(f"• {path.name}" for path in cues)
            raise ConversionError(
                "More than one game appears to be present in the selected folder. "
                "Select one game folder containing only its own disc files.\n\n"
                f"Detected CUE files:\n{names}"
            )
        title = choose_game_title(source, cues)
        output = source / (title + (OUTPUT_SUFFIX if add_suffix else ""))
        if output.exists():
            if not output.is_dir():
                raise ConversionError(f"The output path is blocked by a file:\n{output}")
            return ConversionPlan(source, title, output)
        return ConversionPlan(source, title, output, tuple(cues))

    images = sorted(
        (path for path in files if path.suffix.casefold() in {".bin", ".img", ".iso"}),
        key=lambda path: path.name.casefold(),
    )
    if len(images) == 1:
        title = choose_game_title(source, [], images[0])
        output = source / (title + (OUTPUT_SUFFIX if add_suffix else ""))
        if output.exists():
            if not output.is_dir():
                raise ConversionError(f"The output path is blocked by a file:\n{output}")
            return ConversionPlan(source, title, output)
        return ConversionPlan(source, title, output, direct_image=images[0])
    if len(images) > 1:
        raise ConversionError(
            f"Found {len(images)} disc images but no CUE file. A CUE file is required "
            "to distinguish data and CD-audio tracks safely."
        )
    raise ConversionError(
        "No supported PlayStation image was found. Select the game folder containing "
        "its .cue file and all referenced .bin tracks."
    )


def discover_game_folders(root: Path) -> list[Path]:
    try:
        root = root.expanduser().resolve(strict=True)
    except OSError as exc:
        raise ConversionError(f"The selected parent folder does not exist:\n{root}") from exc
    if not root.is_dir():
        raise ConversionError(f"The selected parent path is not a folder:\n{root}")

    detected: list[Path] = []
    scan_errors: list[str] = []

    def on_error(error: OSError) -> None:
        scan_errors.append(str(error))

    for current_name, directory_names, file_names in os.walk(root, onerror=on_error):
        current = Path(current_name)
        directory_names[:] = [
            name
            for name in directory_names
            if not name.startswith(".psx2eboot-")
            and OUTPUT_SUFFIX.casefold() not in name.casefold()
        ]
        suffixes = {Path(name).suffix.casefold() for name in file_names}
        if ".cue" in suffixes or suffixes.intersection({".bin", ".img", ".iso"}):
            detected.append(current)

    if not detected:
        details = f"\n\nFirst scan error: {scan_errors[0]}" if scan_errors else ""
        raise ConversionError(
            "No game folders containing CUE/BIN/IMG/ISO files were found recursively."
            + details
        )
    return sorted(dict.fromkeys(detected), key=lambda path: str(path).casefold())


def resolve_reference(cue: Path, raw_name: str) -> Path:
    normalized = raw_name.replace("\\", "/")
    candidate = cue.parent / normalized
    if candidate.is_file():
        return candidate.resolve()

    current = cue.parent.resolve()
    parts = [part for part in Path(normalized).parts if part not in {"", "."}]
    for part in parts:
        if part == "..":
            current = current.parent
            continue
        exact = current / part
        if exact.exists():
            current = exact
            continue
        try:
            matches = [entry for entry in current.iterdir() if entry.name.casefold() == part.casefold()]
        except OSError as exc:
            raise ConversionError(f"{cue.name}: cannot resolve referenced file: {raw_name}") from exc
        if len(matches) != 1:
            raise ConversionError(f"{cue.name}: referenced file was not found unambiguously: {raw_name}")
        current = matches[0]
    if not current.is_file():
        raise ConversionError(f"{cue.name}: referenced file is missing: {raw_name}")
    return current.resolve()


def read_cue_text(cue: Path) -> str:
    try:
        return cue.read_text(encoding="utf-8-sig")
    except UnicodeDecodeError:
        return cue.read_text(encoding="cp1252")


def inspect_cue(cue: Path) -> CueInfo:
    text = read_cue_text(cue)
    info = CueInfo(cue)
    current_file: Path | None = None
    current_track: tuple[int, str] | None = None
    seen_track_numbers: set[int] = set()
    indexed_tracks: set[int] = set()

    for line_number, line in enumerate(text.splitlines(), 1):
        file_match = FILE_RE.match(line)
        if file_match:
            raw = (file_match.group(1) or file_match.group(2)).strip()
            current_file = resolve_reference(cue, raw)
            if current_file.stat().st_size == 0:
                raise ConversionError(
                    f"{cue.name}:{line_number}: referenced track file is empty: {current_file.name}"
                )
            if current_file not in info.references:
                info.references.append(current_file)
            continue

        track_match = TRACK_RE.match(line)
        if track_match:
            number = int(track_match.group(1))
            mode = track_match.group(2).upper()
            if current_file is None:
                raise ConversionError(f"{cue.name}:{line_number}: TRACK appears before FILE")
            if number in seen_track_numbers:
                raise ConversionError(f"{cue.name}:{line_number}: duplicate track number {number:02d}")
            seen_track_numbers.add(number)
            current_track = (number, mode)
            info.track_count += 1
            if mode == "AUDIO":
                info.audio_tracks += 1
            else:
                info.data_tracks += 1
            continue

        index_match = INDEX_RE.match(line)
        if index_match and current_track and int(index_match.group(1)) == 1:
            minutes, seconds, frames = map(int, index_match.groups()[1:])
            if seconds >= 60 or frames >= 75:
                raise ConversionError(f"{cue.name}:{line_number}: invalid INDEX timestamp")
            if minutes < 0:
                raise ConversionError(f"{cue.name}:{line_number}: invalid INDEX timestamp")
            indexed_tracks.add(current_track[0])

    if not info.references:
        raise ConversionError(f"{cue.name}: no FILE line was found")
    if not info.track_count:
        raise ConversionError(f"{cue.name}: no TRACK line was found")
    missing_index = seen_track_numbers - indexed_tracks
    if missing_index:
        tracks = ", ".join(f"{number:02d}" for number in sorted(missing_index))
        raise ConversionError(f"{cue.name}: INDEX 01 is missing for track(s): {tracks}")
    if not info.data_tracks:
        raise ConversionError(f"{cue.name}: no data track was found")
    return info


def unique_name(directory: Path, preferred: str) -> str:
    candidate = preferred
    index = 2
    while (directory / candidate).exists():
        path = Path(preferred)
        candidate = f"{path.stem}_{index}{path.suffix}"
        index += 1
    return candidate


def stage_cue(info: CueInfo, destination: Path) -> Path:
    destination.mkdir(parents=True, exist_ok=True)
    text = read_cue_text(info.path)
    mapping: dict[Path, str] = {}

    for reference in info.references:
        copied_name = unique_name(destination, reference.name)
        shutil.copy2(reference, destination / copied_name)
        mapping[reference] = copied_name

    rewritten: list[str] = []
    for line in text.splitlines():
        match = FILE_RE.match(line)
        if not match:
            rewritten.append(line)
            continue
        raw = (match.group(1) or match.group(2)).strip()
        resolved = resolve_reference(info.path, raw)
        rewritten.append(f'FILE "{mapping[resolved]}" {match.group(3).upper()}')

    staged = destination / info.path.name
    staged.write_text("\n".join(rewritten) + "\n", encoding="utf-8")

    wanted = {
        (info.path.stem + suffix).casefold()
        for suffix in (".pspconfig", ".sbi", ".sub")
    } | {
        (info.path.name + suffix).casefold()
        for suffix in (".pspconfig", ".sbi", ".sub")
    }
    for sidecar in info.path.parent.iterdir():
        if sidecar.is_file() and sidecar.name.casefold() in wanted:
            shutil.copy2(sidecar, destination / sidecar.name)
    return staged


def validate_direct_image(path: Path) -> None:
    size = path.stat().st_size
    if size == 0:
        raise ConversionError(f"The disc image is empty: {path.name}")
    if size < 2 * 1024 * 1024:
        raise ConversionError(f"The disc image is implausibly small: {path.name} ({size} bytes)")
    if size % 2048 and size % 2352:
        raise ConversionError(
            f"The image size is not aligned to 2048-byte or 2352-byte sectors: {path.name}"
        )


def verify_output_writable(directory: Path) -> None:
    try:
        with tempfile.NamedTemporaryFile(prefix=".psx2eboot-write-test-", dir=directory, delete=True) as handle:
            handle.write(b"ok")
            handle.flush()
    except OSError as exc:
        raise ConversionError(f"The selected NAS/game folder is not writable:\n{directory}\n\n{exc}") from exc


def container_engine() -> str:
    for name in ("podman", "docker"):
        if shutil.which(name):
            return name
    raise ConversionError(
        "Podman or Docker is required. On CachyOS/Arch Linux run:\n\n"
        "sudo pacman -S --needed podman git"
    )


ProcessCallback = Callable[[subprocess.Popen[str] | None], None]


def stream_command(
    command: list[str],
    log: Logger,
    cancel_event: threading.Event,
    process_callback: ProcessCallback | None = None,
) -> int:
    if cancel_event.is_set():
        raise ConversionCancelled("Conversion cancelled.")
    process = subprocess.Popen(
        command,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        errors="replace",
        bufsize=1,
        start_new_session=True,
    )
    if process_callback:
        process_callback(process)
    try:
        assert process.stdout is not None
        for line in process.stdout:
            log.write(line.rstrip())
            if cancel_event.is_set() and process.poll() is None:
                try:
                    os.killpg(process.pid, signal.SIGTERM)
                except (OSError, ProcessLookupError):
                    process.terminate()
        return_code = process.wait()
    finally:
        if process_callback:
            process_callback(None)
    if cancel_event.is_set():
        raise ConversionCancelled("Conversion cancelled.")
    return return_code


def ensure_image(
    engine: str,
    log: Logger,
    cancel_event: threading.Event,
    process_callback: ProcessCallback | None = None,
) -> None:
    check = subprocess.run(
        [engine, "image", "inspect", IMAGE],
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
        check=False,
    )
    if check.returncode == 0:
        log.write("The pop-fe conversion engine is ready.")
        return
    log.write("First run: building the official pop-fe conversion engine. This can take a while.")
    result = stream_command(
        [engine, "build", "-t", IMAGE, POPFE_GIT],
        log,
        cancel_event,
        process_callback,
    )
    if result != 0:
        raise ConversionError("The pop-fe conversion engine could not be built.")


def validate_pbp(path: Path) -> dict[str, str | int]:
    size = path.stat().st_size
    if size < 1024 * 1024:
        raise ConversionError(f"The generated EBOOT.PBP is implausibly small ({size} bytes).")
    with path.open("rb") as handle:
        header = handle.read(40)
        if len(header) != 40 or header[:4] != b"\x00PBP":
            raise ConversionError("The generated file does not have a valid PBP header.")
        version, *offsets = struct.unpack("<9I", header[4:])
        if offsets != sorted(offsets) or offsets[0] < 40 or offsets[-1] >= size:
            raise ConversionError("The generated PBP contains invalid section offsets.")
        handle.seek(offsets[-1])
        psar_header = handle.read(64)
        if b"PSISOIMG" not in psar_header and b"PSTITLEIMG" not in psar_header:
            raise ConversionError("The generated PBP does not contain a recognizable PS1 section.")

    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return {"size": size, "sha256": digest.hexdigest(), "version": f"0x{version:08x}"}


def find_generated_eboot(install: Path, log: Logger) -> Path:
    candidates = sorted(
        (
            path
            for path in install.rglob("*")
            if path.is_file() and path.name.casefold() == "eboot.pbp"
        ),
        key=lambda path: str(path).casefold(),
    )
    if not candidates:
        produced = sorted(
            str(path.relative_to(install))
            for path in install.rglob("*")
            if path.is_file()
        )
        details = ""
        if produced:
            details = "\n\nFiles created by pop-fe:\n" + "\n".join(produced[:50])
        raise ConversionError(
            "pop-fe finished without reporting an error, but no EBOOT.PBP was found."
            + details
        )
    if len(candidates) != 1:
        listing = "\n".join(str(path.relative_to(install)) for path in candidates)
        raise ConversionError(
            f"pop-fe unexpectedly created {len(candidates)} EBOOT.PBP files:\n{listing}"
        )
    eboot = candidates[0]
    log.write(f"Generated EBOOT found: /work/install/{eboot.relative_to(install)}")
    return eboot


def convert_game(
    plan: ConversionPlan,
    engine: str,
    log: Logger,
    cancel_event: threading.Event,
    process_callback: ProcessCallback | None = None,
) -> ConversionResult:
    log.write(f"Source folder: {plan.source_dir}")
    log.write(f"Output folder: {plan.output_dir}")

    if plan.output_dir.exists():
        if plan.output_dir.is_dir():
            log.write("SKIPPED: The output folder already exists.")
            return ConversionResult("skipped", plan.output_dir)
        raise ConversionError(f"The output path is blocked by a file:\n{plan.output_dir}")

    verify_output_writable(plan.source_dir)
    cue_infos = [inspect_cue(cue) for cue in plan.cues]
    audio_tracks = sum(info.audio_tracks for info in cue_infos)
    data_tracks = sum(info.data_tracks for info in cue_infos)
    track_count = sum(info.track_count for info in cue_infos)
    if plan.direct_image:
        validate_direct_image(plan.direct_image)
        data_tracks = track_count = 1

    discs = len(cue_infos) if cue_infos else 1
    log.write(f"Validated {discs} disc(s), {track_count} track(s), {audio_tracks} audio track(s).")
    if cancel_event.is_set():
        raise ConversionCancelled("Conversion cancelled.")

    with tempfile.TemporaryDirectory(prefix="psx2eboot-") as temp_name:
        work = Path(temp_name)
        source_stage = work / "source"
        install = work / "install"
        source_stage.mkdir()
        (install / "PSP" / "GAME").mkdir(parents=True)
        container_inputs: list[str] = []

        if cue_infos:
            for index, info in enumerate(cue_infos, 1):
                log.write(f"Staging disc {index}/{len(cue_infos)}: {info.path.name}")
                staged = stage_cue(info, source_stage / f"disc{index:02d}")
                container_inputs.append(f"/work/source/disc{index:02d}/{staged.name}")
        else:
            assert plan.direct_image is not None
            log.write(f"Staging disc image: {plan.direct_image.name}")
            staged_image = source_stage / plan.direct_image.name
            shutil.copy2(plan.direct_image, staged_image)
            container_inputs.append(f"/work/source/{staged_image.name}")

        if cancel_event.is_set():
            raise ConversionCancelled("Conversion cancelled.")

        command = [engine, "run", "--rm", "-v", f"{work}:/work:rw"]
        if engine == "docker":
            command += ["--user", f"{os.getuid()}:{os.getgid()}", "-e", "HOME=/tmp"]
        command += [IMAGE, "-v", "--psp-dir=/work/install"]
        if audio_tracks:
            command.append("--psp-use-cdda")
            log.write("CD audio detected. Full CDDA embedding is enabled.")
        command += container_inputs

        log.write("Starting EBOOT conversion.")
        if stream_command(command, log, cancel_event, process_callback) != 0:
            raise ConversionError("pop-fe stopped with an error. See the log for details.")

        eboot = find_generated_eboot(install, log)
        log.write("Validating the PBP header, PS1 section and SHA-256 checksum.")
        pbp = validate_pbp(eboot)
        game_id = eboot.parent.name
        if not re.fullmatch(r"[A-Za-z0-9_.-]{3,32}", game_id):
            raise ConversionError(f"The generated GAME ID folder looks invalid: {game_id}")

        pending = Path(
            tempfile.mkdtemp(
                prefix=f".{plan.output_dir.name}.partial-",
                dir=plan.source_dir,
            )
        )
        try:
            game_destination = pending / game_id
            shutil.copytree(eboot.parent, game_destination)
            if plan.output_dir.exists():
                log.write("SKIPPED: The output folder appeared while conversion was running.")
                return ConversionResult("skipped", plan.output_dir)
            pending.rename(plan.output_dir)
        finally:
            if pending.exists():
                shutil.rmtree(pending)

    log.write(f"COMPLETED: {plan.output_dir}")
    return ConversionResult(
        "converted",
        plan.output_dir,
        game_id,
        discs,
        track_count,
        audio_tracks,
        int(pbp["size"]),
        str(pbp["sha256"]),
    )


class MultiDirectoryDialog:
    """Small native Tk dialog for selecting multiple sibling directories."""

    def __init__(self, parent: object, initial: Path) -> None:
        import tkinter as tk
        from tkinter import messagebox, ttk

        self.tk = tk
        self.messagebox = messagebox
        self.result: list[Path] = []
        self.current = initial.resolve() if initial.is_dir() else Path.home()
        self.names: list[str] = []

        self.window = tk.Toplevel(parent)
        self.window.title("Select multiple game folders")
        self.window.geometry("760x540")
        self.window.minsize(620, 420)
        self.window.transient(parent)
        self.window.protocol("WM_DELETE_WINDOW", self.close)

        outer = ttk.Frame(self.window, padding=16)
        outer.pack(fill="both", expand=True)
        outer.columnconfigure(0, weight=1)
        outer.rowconfigure(2, weight=1)

        ttk.Label(
            outer,
            text="Navigate to the parent folder, then use Ctrl or Shift to select multiple game folders.",
            wraplength=710,
        ).grid(row=0, column=0, columnspan=3, sticky="w", pady=(0, 10))

        self.path_var = tk.StringVar()
        ttk.Button(outer, text="Up", command=self.go_up).grid(row=1, column=0, sticky="w", padx=(0, 8))
        ttk.Entry(outer, textvariable=self.path_var, state="readonly").grid(
            row=1, column=1, sticky="ew", padx=(0, 8)
        )
        ttk.Button(outer, text="Home", command=self.go_home).grid(row=1, column=2)

        list_frame = ttk.Frame(outer)
        list_frame.grid(row=2, column=0, columnspan=3, sticky="nsew", pady=(10, 12))
        list_frame.columnconfigure(0, weight=1)
        list_frame.rowconfigure(0, weight=1)
        self.listbox = tk.Listbox(
            list_frame,
            selectmode="extended",
            activestyle="dotbox",
            exportselection=False,
            font=("Sans", 10),
        )
        scrollbar = ttk.Scrollbar(list_frame, orient="vertical", command=self.listbox.yview)
        self.listbox.configure(yscrollcommand=scrollbar.set)
        self.listbox.grid(row=0, column=0, sticky="nsew")
        scrollbar.grid(row=0, column=1, sticky="ns")
        self.listbox.bind("<Double-Button-1>", lambda _event: self.open_selected())
        self.listbox.bind("<Return>", lambda _event: self.open_selected())
        self.listbox.bind("<Control-a>", self.select_all)

        buttons = ttk.Frame(outer)
        buttons.grid(row=3, column=0, columnspan=3, sticky="ew")
        ttk.Button(buttons, text="Open folder", command=self.open_selected).pack(side="left")
        ttk.Button(buttons, text="Use current folder", command=self.use_current).pack(side="left", padx=(8, 0))
        ttk.Button(buttons, text="Cancel", command=self.close).pack(side="right")
        ttk.Button(buttons, text="Add selected folders", command=self.accept).pack(side="right", padx=(0, 8))

        self.refresh()
        self.window.grab_set()
        self.window.wait_window()

    def refresh(self) -> None:
        self.path_var.set(str(self.current))
        self.listbox.delete(0, "end")
        try:
            directories = sorted(
                (
                    entry
                    for entry in self.current.iterdir()
                    if entry.is_dir() and not entry.name.startswith(".")
                ),
                key=lambda entry: entry.name.casefold(),
            )
        except OSError as exc:
            self.messagebox.showerror(APP_NAME, f"Cannot read this folder:\n\n{exc}", parent=self.window)
            return
        self.names = [entry.name for entry in directories]
        for name in self.names:
            self.listbox.insert("end", name)

    def selected_paths(self) -> list[Path]:
        return [self.current / self.names[index] for index in self.listbox.curselection()]

    def open_selected(self) -> None:
        selected = self.selected_paths()
        if len(selected) != 1:
            self.messagebox.showinfo(
                APP_NAME,
                "Select exactly one folder to open it. Use Ctrl or Shift when adding several folders.",
                parent=self.window,
            )
            return
        self.current = selected[0]
        self.refresh()

    def go_up(self) -> None:
        parent = self.current.parent
        if parent != self.current:
            self.current = parent
            self.refresh()

    def go_home(self) -> None:
        self.current = Path.home()
        self.refresh()

    def select_all(self, _event: object) -> str:
        self.listbox.selection_set(0, "end")
        return "break"

    def accept(self) -> None:
        selected = self.selected_paths()
        if not selected:
            self.messagebox.showwarning(APP_NAME, "Select at least one game folder.", parent=self.window)
            return
        self.result = selected
        self.close()

    def use_current(self) -> None:
        self.result = [self.current]
        self.close()

    def close(self) -> None:
        try:
            self.window.grab_release()
        except self.tk.TclError:
            pass
        self.window.destroy()


class PSX2EBOOTApp:
    def __init__(self) -> None:
        import tkinter as tk
        from tkinter import scrolledtext, ttk

        self.tk = tk
        self.ttk = ttk
        self.scrolledtext = scrolledtext
        self.root = tk.Tk()
        self.root.title(APP_NAME)
        self.root.geometry("1020x860")
        self.root.minsize(820, 700)
        self.root.protocol("WM_DELETE_WINDOW", self.on_close)

        self.source_var = tk.StringVar()
        self.suffix_var = tk.BooleanVar(value=True)
        self.preview_var = tk.StringVar(value="Add one or more game folders to the queue.")
        self.status_var = tk.StringVar(value="Ready")
        self.queued_paths: list[Path] = []
        self.path_items: dict[Path, str] = {}
        self.events: queue.Queue[tuple[str, object]] = queue.Queue()
        self.cancel_event = threading.Event()
        self.worker: threading.Thread | None = None
        self.current_process: subprocess.Popen[str] | None = None
        self.process_lock = threading.Lock()
        self.last_output: Path | None = None

        self._build_ui()
        self.suffix_var.trace_add("write", self._suffix_changed)
        self.root.after(80, self._poll_events)

    def _build_ui(self) -> None:
        tk = self.tk
        ttk = self.ttk
        self.root.configure(bg="#f4f6f8")

        header = tk.Frame(self.root, bg="#1f5fae", padx=28, pady=20)
        header.pack(fill="x")
        tk.Label(
            header,
            text=APP_NAME,
            bg="#1f5fae",
            fg="white",
            font=("Sans", 22, "bold"),
        ).pack(anchor="w")
        tk.Label(
            header,
            text="PlayStation BIN/CUE to PSP EBOOT.PBP converter",
            bg="#1f5fae",
            fg="#dcecff",
            font=("Sans", 10),
        ).pack(anchor="w", pady=(3, 0))

        main = ttk.Frame(self.root, padding=(22, 16))
        main.pack(fill="both", expand=True)
        main.columnconfigure(0, weight=1)
        main.rowconfigure(4, weight=1)

        source_box = ttk.LabelFrame(main, text=" Source folders and conversion queue ", padding=12)
        source_box.grid(row=0, column=0, sticky="nsew")
        source_box.columnconfigure(0, weight=1)
        source_box.rowconfigure(2, weight=1)

        self.source_entry = ttk.Entry(source_box, textvariable=self.source_var)
        self.source_entry.grid(row=0, column=0, sticky="ew", padx=(0, 8))
        self.source_entry.bind("<Return>", lambda _event: self.add_manual_path())
        self.add_button = ttk.Button(source_box, text="Add path", command=self.add_manual_path)
        self.add_button.grid(row=0, column=1, padx=(0, 8))
        self.browse_button = ttk.Button(source_box, text="Browse…", command=self.browse_single)
        self.browse_button.grid(row=0, column=2)

        queue_buttons = ttk.Frame(source_box)
        queue_buttons.grid(row=1, column=0, columnspan=3, sticky="ew", pady=(9, 9))
        self.multi_button = ttk.Button(
            queue_buttons,
            text="Choose multiple folders…",
            command=self.browse_multiple,
        )
        self.multi_button.pack(side="left")
        self.scan_button = ttk.Button(
            queue_buttons,
            text="Scan parent recursively…",
            command=self.scan_parent,
        )
        self.scan_button.pack(side="left", padx=(8, 0))
        self.clear_button = ttk.Button(queue_buttons, text="Clear", command=self.clear_queue)
        self.clear_button.pack(side="right")
        self.remove_button = ttk.Button(queue_buttons, text="Remove selected", command=self.remove_selected)
        self.remove_button.pack(side="right", padx=(0, 8))

        tree_frame = ttk.Frame(source_box)
        tree_frame.grid(row=2, column=0, columnspan=3, sticky="nsew")
        tree_frame.columnconfigure(0, weight=1)
        tree_frame.rowconfigure(0, weight=1)
        self.queue_tree = ttk.Treeview(
            tree_frame,
            columns=("title", "source", "status"),
            show="headings",
            selectmode="extended",
            height=6,
        )
        self.queue_tree.heading("title", text="Detected title")
        self.queue_tree.heading("source", text="Source folder")
        self.queue_tree.heading("status", text="Status")
        self.queue_tree.column("title", width=220, minwidth=130)
        self.queue_tree.column("source", width=560, minwidth=260)
        self.queue_tree.column("status", width=110, minwidth=90, anchor="center")
        tree_scroll = ttk.Scrollbar(tree_frame, orient="vertical", command=self.queue_tree.yview)
        self.queue_tree.configure(yscrollcommand=tree_scroll.set)
        self.queue_tree.grid(row=0, column=0, sticky="nsew")
        tree_scroll.grid(row=0, column=1, sticky="ns")
        self.queue_tree.bind("<<TreeviewSelect>>", lambda _event: self._update_preview())

        output_box = ttk.LabelFrame(main, text=" Output ", padding=12)
        output_box.grid(row=1, column=0, sticky="ew", pady=(12, 0))
        output_box.columnconfigure(0, weight=1)
        self.suffix_check = ttk.Checkbutton(
            output_box,
            text='Add " [PS Vita EBOOT]" to each output folder name',
            variable=self.suffix_var,
        )
        self.suffix_check.grid(row=0, column=0, sticky="w")
        ttk.Label(
            output_box,
            textvariable=self.preview_var,
            wraplength=900,
            foreground="#1f5fae",
        ).grid(row=1, column=0, sticky="w", pady=(7, 0))

        info_box = ttk.LabelFrame(main, text=" What happens ", padding=12)
        info_box.grid(row=2, column=0, sticky="ew", pady=(12, 0))
        info_text = (
            "Each queued game is processed in order. CUE references, multi-file tracks, multi-disc order and "
            "CD audio are validated automatically. The clean title is derived from the original game folder "
            "or, for generic folder names, from the CUE/image name. The result contains only "
            "<GAME ID>/EBOOT.PBP. Copy the GAME ID folder into PSP/GAME or ux0:pspemu/PSP/GAME. "
            "Existing output folders are skipped."
        )
        ttk.Label(info_box, text=info_text, wraplength=920, justify="left").grid(sticky="w")

        action_row = ttk.Frame(main)
        action_row.grid(row=3, column=0, sticky="ew", pady=(13, 9))
        action_row.columnconfigure(1, weight=1)
        self.progress = ttk.Progressbar(action_row, mode="indeterminate", length=170)
        self.progress.grid(row=0, column=0, padx=(0, 12))
        ttk.Label(action_row, textvariable=self.status_var).grid(row=0, column=1, sticky="w")
        self.open_button = ttk.Button(
            action_row,
            text="Open output",
            command=self.open_output,
            state="disabled",
        )
        self.open_button.grid(row=0, column=2, padx=(8, 8))
        self.cancel_button = ttk.Button(
            action_row,
            text="Cancel",
            command=self.cancel,
            state="disabled",
        )
        self.cancel_button.grid(row=0, column=3, padx=(0, 8))
        self.convert_button = ttk.Button(action_row, text="Convert queue", command=self.start_conversion)
        self.convert_button.grid(row=0, column=4)

        log_box = ttk.LabelFrame(main, text=" Conversion log ", padding=8)
        log_box.grid(row=4, column=0, sticky="nsew")
        log_box.columnconfigure(0, weight=1)
        log_box.rowconfigure(0, weight=1)
        self.log_text = self.scrolledtext.ScrolledText(
            log_box,
            height=9,
            wrap="word",
            state="disabled",
            font=("Monospace", 9),
            background="#101820",
            foreground="#d8e2ea",
            insertbackground="white",
        )
        self.log_text.grid(row=0, column=0, sticky="nsew")

        footer = ttk.Frame(main)
        footer.grid(row=5, column=0, sticky="ew", pady=(7, 0))
        ttk.Label(
            footer,
            text=f"Version {VERSION}  •  Conversion engine: pop-fe",
            foreground="#6c7680",
        ).pack(side="right")

        self.input_widgets = [
            self.source_entry,
            self.add_button,
            self.browse_button,
            self.multi_button,
            self.scan_button,
            self.clear_button,
            self.remove_button,
            self.suffix_check,
        ]

    def browse_single(self) -> None:
        from tkinter import filedialog

        selected = filedialog.askdirectory(
            title="Select PlayStation game folder",
            initialdir=str(load_last_directory()),
            mustexist=True,
            parent=self.root,
        )
        if selected:
            path = Path(selected).resolve()
            self.source_var.set(str(path))
            self._add_paths([path])

    def browse_multiple(self) -> None:
        dialog = MultiDirectoryDialog(self.root, load_last_directory())
        if dialog.result:
            self.source_var.set(str(dialog.result[0]))
            self._add_paths(dialog.result)

    def scan_parent(self) -> None:
        from tkinter import filedialog, messagebox

        selected = filedialog.askdirectory(
            title="Select parent folder to scan recursively",
            initialdir=str(load_last_directory()),
            mustexist=True,
            parent=self.root,
        )
        if not selected:
            return
        root = Path(selected).resolve()
        self.source_var.set(str(root))
        self.status_var.set("Scanning folders…")
        self.root.update_idletasks()
        try:
            detected = discover_game_folders(root)
            self._add_paths(detected)
            self.status_var.set(f"Detected {len(detected)} game folder(s)")
        except ConversionError as exc:
            self.status_var.set("Ready")
            messagebox.showerror(APP_NAME, str(exc), parent=self.root)

    def add_manual_path(self) -> None:
        from tkinter import messagebox

        raw = self.source_var.get().strip()
        if not raw:
            messagebox.showwarning(APP_NAME, "Enter or choose a game folder first.", parent=self.root)
            return
        self._add_paths([Path(raw).expanduser()])

    def _add_paths(self, paths: list[Path]) -> None:
        from tkinter import messagebox

        errors: list[str] = []
        added = 0
        for raw_path in paths:
            try:
                path = raw_path.expanduser().resolve(strict=True)
                if path in self.queued_paths:
                    continue
                plan = build_plan(path, self.suffix_var.get())
                status = "Will skip" if plan.output_dir.exists() else "Queued"
                item = self.queue_tree.insert(
                    "",
                    "end",
                    values=(plan.title, str(path), status),
                )
                self.queued_paths.append(path)
                self.path_items[path] = item
                added += 1
                save_last_directory(path.parent)
            except (OSError, ConversionError) as exc:
                errors.append(f"{raw_path}: {exc}")
        self._update_preview()
        if added:
            self.status_var.set(f"{len(self.queued_paths)} game(s) queued")
        if errors:
            shown = "\n\n".join(errors[:8])
            if len(errors) > 8:
                shown += f"\n\n…and {len(errors) - 8} more."
            messagebox.showwarning(APP_NAME, f"Some folders were not added:\n\n{shown}", parent=self.root)

    def remove_selected(self) -> None:
        selected = set(self.queue_tree.selection())
        if not selected:
            return
        removed_paths = {path for path, item in self.path_items.items() if item in selected}
        for item in selected:
            self.queue_tree.delete(item)
        self.queued_paths = [path for path in self.queued_paths if path not in removed_paths]
        for path in removed_paths:
            self.path_items.pop(path, None)
        self.status_var.set(f"{len(self.queued_paths)} game(s) queued" if self.queued_paths else "Ready")
        self._update_preview()

    def clear_queue(self) -> None:
        for item in self.queue_tree.get_children():
            self.queue_tree.delete(item)
        self.queued_paths.clear()
        self.path_items.clear()
        self.status_var.set("Ready")
        self._update_preview()

    def _suffix_changed(self, *_args: object) -> None:
        self._refresh_queue_metadata()
        self._update_preview()

    def _refresh_queue_metadata(self) -> None:
        for path in self.queued_paths:
            item = self.path_items[path]
            try:
                plan = build_plan(path, self.suffix_var.get())
                status = "Will skip" if plan.output_dir.exists() else "Queued"
                self.queue_tree.item(item, values=(plan.title, str(path), status))
            except ConversionError as exc:
                self.queue_tree.item(item, values=(clean_title(path.name), str(path), f"Error: {exc}"))

    def _update_preview(self) -> None:
        selected = self.queue_tree.selection()
        if len(selected) == 1:
            path = next((path for path, item in self.path_items.items() if item == selected[0]), None)
            if path:
                try:
                    plan = build_plan(path, self.suffix_var.get())
                    self.preview_var.set(f"Output: {plan.output_dir} / <GAME ID> / EBOOT.PBP")
                    return
                except ConversionError:
                    pass
        if self.queued_paths:
            suffix = OUTPUT_SUFFIX if self.suffix_var.get() else ""
            self.preview_var.set(
                f"{len(self.queued_paths)} game(s): each source folder receives "
                f"<Clean title>{suffix}/<GAME ID>/EBOOT.PBP"
            )
        else:
            self.preview_var.set("Add one or more game folders to the queue.")

    def _append_log(self, line: str) -> None:
        self.log_text.configure(state="normal")
        self.log_text.insert("end", line + "\n")
        self.log_text.see("end")
        self.log_text.configure(state="disabled")

    def _set_process(self, process: subprocess.Popen[str] | None) -> None:
        with self.process_lock:
            self.current_process = process

    def _set_job_status(self, source: Path, status: str) -> None:
        item = self.path_items.get(source)
        if not item:
            return
        values = list(self.queue_tree.item(item, "values"))
        if len(values) == 3:
            values[2] = status
            self.queue_tree.item(item, values=values)

    def start_conversion(self) -> None:
        from tkinter import messagebox

        if self.worker and self.worker.is_alive():
            return
        if not self.queued_paths:
            messagebox.showwarning(APP_NAME, "Add at least one game folder to the queue.", parent=self.root)
            return

        plans: list[ConversionPlan] = []
        errors: list[str] = []
        for path in self.queued_paths:
            try:
                plans.append(build_plan(path, self.suffix_var.get()))
            except ConversionError as exc:
                errors.append(f"{path}: {exc}")
                self._set_job_status(path, "Invalid")
        if errors:
            messagebox.showerror(
                APP_NAME,
                "Fix or remove these invalid queue entries first:\n\n" + "\n\n".join(errors[:8]),
                parent=self.root,
            )
            return

        self.cancel_event.clear()
        self.last_output = None
        self.open_button.configure(state="disabled")
        self.convert_button.configure(state="disabled")
        for widget in self.input_widgets:
            widget.configure(state="disabled")
        self.cancel_button.configure(state="normal")
        self.progress.start(12)
        self.status_var.set(f"Preparing {len(plans)} game(s)…")
        self.log_text.configure(state="normal")
        self.log_text.delete("1.0", "end")
        self.log_text.configure(state="disabled")
        for plan in plans:
            self._set_job_status(plan.source_dir, "Queued")

        self.worker = threading.Thread(
            target=self._conversion_worker,
            args=(tuple(plans),),
            name="psx2eboot-converter",
            daemon=True,
        )
        self.worker.start()

    def _conversion_worker(self, plans: tuple[ConversionPlan, ...]) -> None:
        log = Logger(lambda line: self.events.put(("log", line)))
        results: list[ConversionResult] = []
        failures: list[tuple[Path, str]] = []
        try:
            pending = [plan for plan in plans if not plan.output_dir.exists()]
            engine = ""
            if pending:
                engine = container_engine()
                log.write(f"Container engine: {engine}")
                ensure_image(engine, log, self.cancel_event, self._set_process)
            else:
                log.write("Every queued output folder already exists. The conversion engine will not be started.")

            for index, plan in enumerate(plans, 1):
                if self.cancel_event.is_set():
                    raise ConversionCancelled("Conversion cancelled.")
                self.events.put(("job_status", (plan.source_dir, "Converting")))
                self.events.put(("status", f"Game {index}/{len(plans)}: {plan.title}"))
                log.write("")
                log.write(f"=== GAME {index}/{len(plans)}: {plan.title} ===")
                try:
                    result = convert_game(plan, engine, log, self.cancel_event, self._set_process)
                    results.append(result)
                    label = "Skipped" if result.status == "skipped" else "Completed"
                    self.events.put(("job_status", (plan.source_dir, label)))
                except ConversionCancelled:
                    raise
                except Exception as exc:
                    failures.append((plan.source_dir, str(exc)))
                    log.write(f"FAILED: {exc}")
                    self.events.put(("job_status", (plan.source_dir, "Failed")))

            log_path = save_last_log(log)
            self.events.put(("done", BatchSummary(tuple(results), tuple(failures), log_path)))
        except ConversionCancelled as exc:
            log_path = save_last_log(log, exc)
            self.events.put(("cancelled", (exc, tuple(results), log_path)))
        except Exception as exc:
            log_path = save_last_log(log, exc)
            self.events.put(("error", (exc, log_path)))

    def _poll_events(self) -> None:
        from tkinter import messagebox

        try:
            while True:
                kind, payload = self.events.get_nowait()
                if kind == "log":
                    self._append_log(str(payload))
                elif kind == "status":
                    self.status_var.set(str(payload))
                elif kind == "job_status":
                    source, status = payload
                    self._set_job_status(source, str(status))
                elif kind == "done":
                    summary = payload
                    assert isinstance(summary, BatchSummary)
                    self._finish_busy_state()
                    converted = [result for result in summary.results if result.status == "converted"]
                    skipped = [result for result in summary.results if result.status == "skipped"]
                    if summary.results:
                        self.last_output = summary.results[-1].output_dir
                        self.open_button.configure(state="normal")
                    self.status_var.set(
                        f"Finished: {len(converted)} converted, {len(skipped)} skipped, "
                        f"{len(summary.failures)} failed"
                    )
                    message = (
                        "Queue finished.\n\n"
                        f"Converted: {len(converted)}\n"
                        f"Skipped: {len(skipped)}\n"
                        f"Failed: {len(summary.failures)}"
                    )
                    if summary.failures:
                        details = "\n".join(f"• {path.name}: {error}" for path, error in summary.failures[:6])
                        message += f"\n\nFailures:\n{details}"
                        if summary.log_path:
                            message += f"\n\nFull log:\n{summary.log_path}"
                        messagebox.showwarning(APP_NAME, message, parent=self.root)
                    else:
                        messagebox.showinfo(APP_NAME, message, parent=self.root)
                elif kind == "cancelled":
                    _error, partial_results, log_path = payload
                    self._finish_busy_state()
                    self.status_var.set("Queue cancelled")
                    message = f"Queue cancelled. Completed results were kept: {len(partial_results)}."
                    if log_path:
                        message += f"\n\nLast-run log:\n{log_path}"
                    messagebox.showinfo(APP_NAME, message, parent=self.root)
                elif kind == "error":
                    self._finish_busy_state()
                    self.status_var.set("Conversion failed")
                    error, log_path = payload
                    message = str(error)
                    if log_path:
                        message += f"\n\nLast-run log:\n{log_path}"
                    messagebox.showerror(APP_NAME, message, parent=self.root)
        except queue.Empty:
            pass
        self.root.after(80, self._poll_events)

    def _finish_busy_state(self) -> None:
        self.progress.stop()
        self.convert_button.configure(state="normal")
        for widget in self.input_widgets:
            widget.configure(state="normal")
        self.cancel_button.configure(state="disabled")
        self._set_process(None)

    def cancel(self) -> None:
        if not (self.worker and self.worker.is_alive()):
            return
        self.cancel_event.set()
        self.status_var.set("Cancelling…")
        self.cancel_button.configure(state="disabled")
        with self.process_lock:
            process = self.current_process
        if process and process.poll() is None:
            try:
                os.killpg(process.pid, signal.SIGTERM)
            except (OSError, ProcessLookupError):
                try:
                    process.terminate()
                except OSError:
                    pass

    def open_output(self) -> None:
        from tkinter import messagebox

        target = self.last_output
        selected = self.queue_tree.selection()
        if len(selected) == 1:
            path = next((path for path, item in self.path_items.items() if item == selected[0]), None)
            if path:
                try:
                    candidate = build_plan(path, self.suffix_var.get()).output_dir
                    if candidate.is_dir():
                        target = candidate
                except ConversionError:
                    pass
        if not target or not target.is_dir():
            return
        try:
            subprocess.Popen(
                ["xdg-open", str(target)],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
            )
        except OSError as exc:
            messagebox.showerror(APP_NAME, f"Could not open the output folder:\n\n{exc}", parent=self.root)

    def on_close(self) -> None:
        from tkinter import messagebox

        if self.worker and self.worker.is_alive():
            if not messagebox.askyesno(
                APP_NAME,
                "A conversion is still running. Cancel it and close PSX2EBOOT?",
                parent=self.root,
            ):
                return
            self.cancel()
        self.root.destroy()

    def run(self) -> int:
        self.root.mainloop()
        return 0


def main() -> int:
    if len(sys.argv) == 2 and sys.argv[1] in {"--version", "-V"}:
        print(f"{APP_NAME} {VERSION}")
        return 0
    if len(sys.argv) != 1:
        print(f"Usage: {Path(sys.argv[0]).name} [--version]", file=sys.stderr)
        return 2
    try:
        return PSX2EBOOTApp().run()
    except ImportError as exc:
        print(
            "PSX2EBOOT requires Tkinter. On CachyOS/Arch Linux run:\n\n"
            "sudo pacman -S --needed tk",
            file=sys.stderr,
        )
        print(f"\nDetails: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())

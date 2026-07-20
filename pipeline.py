"""Unified pipeline: video ↔ contact sheets.

Uses raskadrovka.py for video → storyboard sheets,
and extract_frames.py for scanned sheets → video/GIF.
"""

from __future__ import annotations

import shutil
import tempfile
from dataclasses import dataclass, field
from pathlib import Path

import extract_frames as crop
import raskadrovka as rk


@dataclass
class VideoJobResult:
    videos: list[Path] = field(default_factory=list)
    storyboard_pages: list[Path] = field(default_factory=list)
    contact_sheets: list[Path] = field(default_factory=list)
    frames_dir: Path | None = None
    log: str = ""


@dataclass
class ScanJobResult:
    video: Path | None = None
    gif: Path | None = None
    frame_count: int = 0
    preview_frames: list[Path] = field(default_factory=list)
    boxes: list[Path] = field(default_factory=list)
    log: str = ""


def run_video_to_sheets(
    video: Path,
    output_dir: Path,
    *,
    interval: float = 0.25,
    hold: float = 0.1,
    storyboard: bool = True,
    contact_sheet: bool = False,
    storyboard_only: bool = False,
    keep_frames: bool = True,
    audio: bool = False,
    per_page: int = 12,
    sheet_cols: int = 6,
) -> VideoJobResult:
    """Extract frames from video and build storyboard / stutter videos."""
    video = video.resolve()
    output_dir = output_dir.resolve()
    output_dir.mkdir(parents=True, exist_ok=True)

    if shutil.which("ffmpeg") is None or shutil.which("ffprobe") is None:
        raise RuntimeError("Нужен ffmpeg (и ffprobe) в PATH.")

    stem = video.stem
    frames_base = output_dir / f"frames_{stem}"
    raw_frames_dir = frames_base / "_raw"
    lines: list[str] = []

    duration = rk.probe_duration(video)
    lines.append(f"Видео: {video.name} ({duration:.2f} с)")

    if frames_base.exists():
        shutil.rmtree(frames_base, ignore_errors=True)

    lines.append(f"Кадр каждые {interval} с")
    frames = rk.extract_frames(video, raw_frames_dir, interval)
    lines.append(f"Извлечено кадров: {len(frames)}")

    indexed = rk.split_into_segments_with_indices(frames)
    if not indexed:
        shutil.rmtree(raw_frames_dir, ignore_errors=True)
        raise RuntimeError("После фильтра чёрных кадров ничего не осталось.")

    black_count = len(frames) - sum(len(seg) for _, seg in indexed)
    lines.append(f"Частей: {len(indexed)} (чёрных вставок: {black_count})")

    result = VideoJobResult()
    segments: list[list[Path]] = []

    for part_idx, (indices, seg_frames) in enumerate(indexed, 1):
        part_tag = f"part_{part_idx:02d}"
        part_dir = frames_base / part_tag
        part_frames = rk.write_segment_frames(seg_frames, part_dir)
        segments.append(part_frames)

        out_video = output_dir / f"{stem}_{part_tag}_raskadrovka.mp4"
        if not storyboard_only:
            audio_start = audio_duration = None
            if audio:
                audio_start, audio_duration = rk.segment_audio_range(indices, interval)
            rk.assemble_video(
                part_dir,
                out_video,
                hold,
                audio_source=video if audio else None,
                audio_start=audio_start,
                audio_duration=audio_duration,
            )
            result.videos.append(out_video)
            lines.append(f"Часть {part_idx}: {len(part_frames)} кадров → {out_video.name}")
        else:
            lines.append(f"Часть {part_idx}: {len(part_frames)} кадров")

    shutil.rmtree(raw_frames_dir, ignore_errors=True)

    if contact_sheet:
        result.contact_sheets = rk.make_contact_sheet(
            segments, output_dir, stem, cols=sheet_cols
        )
        lines.append(f"Contact sheets: {len(result.contact_sheets)}")

    if storyboard:
        storyboard_dir = output_dir / f"storyboard_{stem}"
        cols, rows = rk.PAGE_COLS, rk.PAGE_ROWS
        if per_page != rk.FRAMES_PER_PAGE:
            for c in range(1, per_page + 1):
                if per_page % c == 0:
                    cols, rows = c, per_page // c
        result.storyboard_pages = rk.make_a4_storyboard(
            segments,
            storyboard_dir,
            per_page=per_page,
            cols=cols,
            rows=rows,
        )
        lines.append(f"Листов A4: {len(result.storyboard_pages)} → {storyboard_dir}")

    if keep_frames:
        result.frames_dir = frames_base
        lines.append(f"Кадры: {frames_base}")
    else:
        shutil.rmtree(frames_base, ignore_errors=True)

    result.log = "\n".join(lines)
    return result


def run_scans_to_video(
    scan_paths: list[Path],
    output_dir: Path,
    *,
    fps: float = 16.0,
    hold: float = 0.1,
    gif_width: int = 720,
    rotate_all: int = 0,
    rows: int | None = None,
    pdf_dpi: int = 300,
    make_gif: bool = True,
    make_video: bool = True,
    per_file_rotate: int | None = None,
    major: str = "column",
    h_dir: str = "ltr",
    v_dir: str = "ttb",
) -> ScanJobResult:
    """Crop frames from scanned contact sheets using crop/extract_frames."""
    output_dir = output_dir.resolve()
    output_dir.mkdir(parents=True, exist_ok=True)
    debug_dir = output_dir / "frames"
    debug_dir.mkdir(parents=True, exist_ok=True)

    all_frames: list = []
    lines: list[str] = []
    boxes: list[Path] = []

    order_label = f"{major}/{h_dir}/{v_dir}"
    lines.append(f"Порядок чтения: {order_label}")

    for path in scan_paths:
        path = Path(path)
        post = crop.SCAN_POSTPROCESS.get(path.name, {})
        rotate_cw = (
            per_file_rotate
            if per_file_rotate is not None
            else int(post.get("rotate_cw", 0))
        )
        reverse = bool(post.get("reverse", False))
        frames = crop.process_scan(
            path,
            rows=rows,
            debug_dir=debug_dir,
            rotate_cw=rotate_cw,
            reverse=reverse,
            pdf_dpi=pdf_dpi,
            major=major,
            h_dir=h_dir,
            v_dir=v_dir,
        )
        lines.append(f"{path.name}: {len(frames)} кадров (rotate={rotate_cw})")
        all_frames.extend(frames)
        box = debug_dir / f"{path.stem}_boxes.png"
        if box.exists():
            boxes.append(box)

    if not all_frames:
        raise RuntimeError("Не удалось вырезать ни одного кадра со сканов.")

    if rotate_all:
        all_frames = crop.apply_frame_transforms(all_frames, rotate_cw=rotate_all)
        lines.append(f"Общий поворот: {rotate_all}°")

    for idx, frame in enumerate(all_frames, start=1):
        import cv2

        cv2.imwrite(str(debug_dir / f"sequence_{idx:02d}.png"), frame)

    result = ScanJobResult(frame_count=len(all_frames), boxes=boxes)
    result.preview_frames = sorted(debug_dir.glob("sequence_*.png"))[:24]

    if make_video:
        video_path = output_dir / "output.mp4"
        crop.build_video(all_frames, video_path, fps=fps, hold_seconds=hold)
        result.video = video_path
        lines.append(f"Видео: {video_path}")

    if make_gif:
        gif_path = output_dir / "output.gif"
        crop.build_gif(
            all_frames, gif_path, fps=fps, hold_seconds=hold, max_width=gif_width
        )
        result.gif = gif_path
        lines.append(f"GIF: {gif_path}")

    result.log = "\n".join(lines)
    return result


def save_uploads(files: list, dest_dir: Path) -> list[Path]:
    """Copy paths into dest_dir with original names."""
    dest_dir.mkdir(parents=True, exist_ok=True)
    saved: list[Path] = []
    for f in files:
        src = Path(f if isinstance(f, (str, Path)) else f.name)
        dest = dest_dir / src.name
        shutil.copy2(src, dest)
        saved.append(dest)
    return saved


IMAGE_SUFFIXES = {".png", ".jpg", ".jpeg", ".bmp", ".webp", ".tif", ".tiff"}
VIDEO_SUFFIXES = {".mp4", ".mov", ".avi", ".mkv", ".webm", ".m4v"}
SHEET_SUFFIXES = IMAGE_SUFFIXES | {".pdf"}


def rotate_image_file(path: Path, degrees_cw: int, *, inplace: bool = True) -> Path:
    """Rotate an image file by 90/180/270 CW. Returns output path."""
    from PIL import Image

    degrees_cw = degrees_cw % 360
    if degrees_cw not in (0, 90, 180, 270):
        raise ValueError("degrees_cw must be 0, 90, 180 or 270")
    if degrees_cw == 0:
        return path

    img = Image.open(path)
    # PIL rotate is CCW; convert CW → CCW
    rotated = img.rotate(-degrees_cw, expand=True)
    out = path if inplace else path.with_name(f"{path.stem}_r{degrees_cw}{path.suffix}")
    # Keep format
    save_kwargs = {}
    if out.suffix.lower() in {".jpg", ".jpeg"}:
        save_kwargs["quality"] = 95
    rotated.save(out, **save_kwargs)
    return out


def rotate_video_file(path: Path, degrees_cw: int, *, inplace: bool = False) -> Path:
    """Rotate video with ffmpeg. Writes beside source unless inplace (then replaces)."""
    degrees_cw = degrees_cw % 360
    if degrees_cw not in (0, 90, 180, 270):
        raise ValueError("degrees_cw must be 0, 90, 180 or 270")
    if degrees_cw == 0:
        return path
    if shutil.which("ffmpeg") is None:
        raise RuntimeError("Нужен ffmpeg в PATH.")

    # transpose=1: 90 CW, transpose=2: 90 CCW
    if degrees_cw == 90:
        vf = "transpose=1"
    elif degrees_cw == 270:
        vf = "transpose=2"
    else:
        vf = "transpose=1,transpose=1"

    tmp = path.with_name(f"{path.stem}_rot{degrees_cw}_tmp{path.suffix}")
    out = path if inplace else path.with_name(f"{path.stem}_r{degrees_cw}{path.suffix}")
    rk.run(
        [
            "ffmpeg",
            "-y",
            "-i",
            str(path),
            "-vf",
            vf,
            "-c:a",
            "copy",
            str(tmp),
        ],
        quiet=True,
    )
    if inplace:
        tmp.replace(path)
        return path
    tmp.replace(out)
    return out


def rotate_media(path: Path, degrees_cw: int, *, inplace: bool = True) -> Path:
    """Rotate image or video file."""
    suffix = path.suffix.lower()
    if suffix in IMAGE_SUFFIXES:
        return rotate_image_file(path, degrees_cw, inplace=inplace)
    if suffix in VIDEO_SUFFIXES:
        return rotate_video_file(path, degrees_cw, inplace=inplace)
    if suffix == ".pdf":
        raise ValueError("PDF крутите после рендера в картинки, или поверните кадры в UI.")
    raise ValueError(f"Неподдерживаемый тип: {path.suffix}")


def rotate_many(paths: list[Path], degrees_cw: int, *, inplace: bool = True) -> list[Path]:
    return [rotate_media(p, degrees_cw, inplace=inplace) for p in paths]


def _ffmpeg_vf(path: Path, vf: str, *, inplace: bool, tag: str) -> Path:
    if shutil.which("ffmpeg") is None:
        raise RuntimeError("Нужен ffmpeg в PATH.")
    tmp = path.with_name(f"{path.stem}_{tag}_tmp{path.suffix}")
    out = path if inplace else path.with_name(f"{path.stem}_{tag}{path.suffix}")
    rk.run(
        [
            "ffmpeg",
            "-y",
            "-i",
            str(path),
            "-vf",
            vf,
            "-c:a",
            "copy",
            str(tmp),
        ],
        quiet=True,
    )
    if inplace:
        tmp.replace(path)
        return path
    tmp.replace(out)
    return out


def flip_image_file(
    path: Path,
    *,
    horizontal: bool = False,
    vertical: bool = False,
    inplace: bool = True,
) -> Path:
    from PIL import Image

    if not horizontal and not vertical:
        return path
    img = Image.open(path)
    if horizontal:
        img = img.transpose(Image.Transpose.FLIP_LEFT_RIGHT)
    if vertical:
        img = img.transpose(Image.Transpose.FLIP_TOP_BOTTOM)
    out = path if inplace else path.with_name(
        f"{path.stem}_f{'h' if horizontal else ''}{'v' if vertical else ''}{path.suffix}"
    )
    save_kwargs = {}
    if out.suffix.lower() in {".jpg", ".jpeg"}:
        save_kwargs["quality"] = 95
    img.save(out, **save_kwargs)
    return out


def flip_video_file(
    path: Path,
    *,
    horizontal: bool = False,
    vertical: bool = False,
    inplace: bool = False,
) -> Path:
    if not horizontal and not vertical:
        return path
    parts = []
    if horizontal:
        parts.append("hflip")
    if vertical:
        parts.append("vflip")
    tag = "f" + ("h" if horizontal else "") + ("v" if vertical else "")
    return _ffmpeg_vf(path, ",".join(parts), inplace=inplace, tag=tag)


def flip_media(
    path: Path,
    *,
    horizontal: bool = False,
    vertical: bool = False,
    inplace: bool = True,
) -> Path:
    suffix = path.suffix.lower()
    if suffix in IMAGE_SUFFIXES:
        return flip_image_file(
            path, horizontal=horizontal, vertical=vertical, inplace=inplace
        )
    if suffix in VIDEO_SUFFIXES:
        return flip_video_file(
            path, horizontal=horizontal, vertical=vertical, inplace=inplace
        )
    if suffix == ".pdf":
        raise ValueError("PDF отражайте после рендера в картинки.")
    raise ValueError(f"Неподдерживаемый тип: {path.suffix}")


def flip_many(
    paths: list[Path],
    *,
    horizontal: bool = False,
    vertical: bool = False,
    inplace: bool = True,
) -> list[Path]:
    return [
        flip_media(p, horizontal=horizontal, vertical=vertical, inplace=inplace)
        for p in paths
    ]
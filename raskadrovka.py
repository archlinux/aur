#!/usr/bin/env python3
"""
Раскадровка видео: вырезает кадры, делит по чёрным вставкам на части,
собирает отдельное «рваное» видео и папку кадров для каждой части.

Пример:
  python raskadrovka.py video.mp4 --storyboard --keep-frames
"""

from __future__ import annotations

import argparse
import shutil
import subprocess
import sys
from pathlib import Path


def run(cmd: list[str], *, quiet: bool = False) -> None:
    if not quiet:
        print("→", " ".join(cmd))
    result = subprocess.run(cmd, capture_output=quiet, text=True)
    if result.returncode != 0:
        if quiet and result.stderr:
            print(result.stderr, file=sys.stderr)
        raise RuntimeError(f"Команда завершилась с ошибкой ({result.returncode}): {' '.join(cmd)}")


def probe_duration(video: Path) -> float:
    out = subprocess.check_output(
        [
            "ffprobe",
            "-v",
            "error",
            "-show_entries",
            "format=duration",
            "-of",
            "default=noprint_wrappers=1:nokey=1",
            str(video),
        ],
        text=True,
    ).strip()
    return float(out)


def extract_frames(video: Path, frames_dir: Path, interval: float) -> list[Path]:
    frames_dir.mkdir(parents=True, exist_ok=True)
    pattern = frames_dir / "frame_%04d.jpg"

    # fps=1/interval — один кадр каждые N секунд
    vf = f"fps=1/{interval}"
    run(
        [
            "ffmpeg",
            "-y",
            "-i",
            str(video),
            "-vf",
            vf,
            "-q:v",
            "2",
            str(pattern),
        ]
    )

    frames = sorted(frames_dir.glob("frame_*.jpg"))
    if not frames:
        raise RuntimeError("Не удалось извлечь ни одного кадра. Попробуйте уменьшить --interval.")
    return frames


def assemble_video(
    frames_dir: Path,
    output: Path,
    hold: float,
    *,
    audio_source: Path | None = None,
    audio_start: float | None = None,
    audio_duration: float | None = None,
) -> None:
    fps = 1.0 / hold
    input_pattern = frames_dir / "frame_%04d.jpg"

    cmd = [
        "ffmpeg",
        "-y",
        "-framerate",
        f"{fps:.6f}",
        "-i",
        str(input_pattern),
    ]

    use_audio = audio_source is not None
    if use_audio:
        cmd.extend(["-ss", f"{audio_start:.3f}", "-i", str(audio_source)])
        if audio_duration is not None:
            cmd.extend(["-t", f"{audio_duration:.3f}"])

    cmd.extend(
        [
            "-c:v",
            "libx264",
            "-pix_fmt",
            "yuv420p",
            "-crf",
            "18",
        ]
    )

    if use_audio:
        cmd.extend(["-c:a", "aac", "-shortest"])
    else:
        cmd.append("-an")

    output.parent.mkdir(parents=True, exist_ok=True)
    cmd.append(str(output))
    run(cmd)


def is_black_separator(path: Path, *, threshold: int = 10, dark_ratio: float = 0.98) -> bool:
    from PIL import Image

    img = Image.open(path).convert("L")
    if hasattr(img, "get_flattened_data"):
        data = img.get_flattened_data()
    else:
        data = list(img.getdata())
    n = len(data)
    if n == 0:
        return True
    dark = sum(1 for p in data if p < 30)
    mean = sum(data) / n
    return mean < threshold and dark / n >= dark_ratio


def write_segment_frames(seg_frames: list[Path], dest_dir: Path) -> list[Path]:
    if dest_dir.exists():
        shutil.rmtree(dest_dir)
    dest_dir.mkdir(parents=True)

    written: list[Path] = []
    for i, src in enumerate(seg_frames, 1):
        dest = dest_dir / f"frame_{i:04d}.jpg"
        shutil.copy2(src, dest)
        written.append(dest)
    return written


def split_into_segments_with_indices(
    frames: list[Path],
) -> list[tuple[list[int], list[Path]]]:
    segments: list[tuple[list[int], list[Path]]] = []
    current_indices: list[int] = []
    current_frames: list[Path] = []

    for index, frame in enumerate(frames, 1):
        if is_black_separator(frame):
            if current_frames:
                segments.append((current_indices, current_frames))
                current_indices = []
                current_frames = []
            continue
        current_indices.append(index)
        current_frames.append(frame)

    if current_frames:
        segments.append((current_indices, current_frames))
    return segments


def segment_audio_range(indices: list[int], interval: float) -> tuple[float, float]:
    start = (min(indices) - 1) * interval
    duration = (max(indices) - min(indices) + 1) * interval
    return start, duration


# A4 при 300 dpi, альбомная ориентация — удобнее для широких кадров
A4_LANDSCAPE = (3508, 2480)
FRAMES_PER_PAGE = 12
PAGE_COLS = 4
PAGE_ROWS = 3


def _fit_in_box(img, box_w: int, box_h: int):
    from PIL import Image

    ratio = min(box_w / img.width, box_h / img.height)
    new_w = max(1, int(img.width * ratio))
    new_h = max(1, int(img.height * ratio))
    return img.resize((new_w, new_h), Image.Resampling.LANCZOS)


def make_a4_storyboard(
    segments: list[list[Path]],
    output_dir: Path,
    *,
    per_page: int = FRAMES_PER_PAGE,
    cols: int = PAGE_COLS,
    rows: int = PAGE_ROWS,
    dpi: int = 300,
) -> list[Path]:
    try:
        from PIL import Image, ImageDraw, ImageFont
    except ImportError:
        print("Pillow не установлен — пропускаю A4-раскадровку. pip install Pillow")
        return []

    if cols * rows != per_page:
        raise ValueError(f"cols({cols}) × rows({rows}) должно быть равно per_page({per_page})")

    output_dir.mkdir(parents=True, exist_ok=True)
    page_w, page_h = A4_LANDSCAPE
    margin = 80
    gap = 24
    label_h = 36
    header_h = 56

    grid_w = page_w - 2 * margin
    grid_h = page_h - 2 * margin - header_h
    cell_w = (grid_w - gap * (cols - 1)) // cols
    cell_h = (grid_h - gap * (rows - 1)) // rows
    thumb_h = cell_h - label_h

    try:
        font = ImageFont.truetype("DejaVuSans.ttf", 22)
        header_font = ImageFont.truetype("DejaVuSans-Bold.ttf", 30)
    except OSError:
        font = ImageFont.load_default()
        header_font = font

    saved: list[Path] = []
    page_num = 0

    for seg_idx, seg_frames in enumerate(segments, 1):
        for page_start in range(0, len(seg_frames), per_page):
            page_frames = seg_frames[page_start : page_start + per_page]
            page_num += 1
            sheet = Image.new("RGB", (page_w, page_h), (255, 255, 255))
            draw = ImageDraw.Draw(sheet)

            header = f"Часть {seg_idx}"
            if len(seg_frames) > per_page:
                part = page_start // per_page + 1
                total_parts = (len(seg_frames) + per_page - 1) // per_page
                header = f"{header}  ({part}/{total_parts})"

            draw.text((margin, margin - 8), header, fill=(20, 20, 20), font=header_font)
            draw.line(
                [(margin, margin + header_h - 18), (page_w - margin, margin + header_h - 18)],
                fill=(180, 180, 180),
                width=2,
            )

            grid_top = margin + header_h
            for slot, frame_path in enumerate(page_frames):
                frame_idx = page_start + slot
                col = slot % cols
                row = slot // cols

                cell_x = margin + col * (cell_w + gap)
                cell_y = grid_top + row * (cell_h + gap)

                img = Image.open(frame_path).convert("RGB")
                thumb = _fit_in_box(img, cell_w, thumb_h)
                paste_x = cell_x + (cell_w - thumb.width) // 2
                paste_y = cell_y + (thumb_h - thumb.height) // 2
                sheet.paste(thumb, (paste_x, paste_y))

                label = f"{frame_idx + 1:03d}"
                bbox = draw.textbbox((0, 0), label, font=font)
                text_w = bbox[2] - bbox[0]
                draw.text(
                    (cell_x + (cell_w - text_w) // 2, cell_y + thumb_h + 6),
                    label,
                    fill=(40, 40, 40),
                    font=font,
                )

            out_path = output_dir / f"storyboard_page_{page_num:03d}.jpg"
            sheet.save(out_path, quality=92, dpi=(dpi, dpi))
            saved.append(out_path)
            print(
                f"Лист A4 {page_num}: {header}, {len(page_frames)} кадров → {out_path.name}"
            )

    print(
        f"Раскадровка: {len(saved)} лист(ов) A4, {len(segments)} част(ей) в {output_dir}"
    )
    return saved


def make_contact_sheet(
    segments: list[list[Path]],
    output_dir: Path,
    stem: str,
    *,
    cols: int = 6,
    thumb_w: int = 320,
) -> list[Path]:
    """Одна картинка-сетка на часть, как на примере (тёмный фон, без A4)."""
    try:
        from PIL import Image
    except ImportError:
        print("Pillow не установлен — пропускаю contact sheet. pip install Pillow")
        return []

    output_dir.mkdir(parents=True, exist_ok=True)
    saved: list[Path] = []

    for seg_idx, seg_frames in enumerate(segments, 1):
        if not seg_frames:
            continue

        images = [Image.open(p).convert("RGB") for p in seg_frames]
        thumb_h = int(thumb_w * images[0].height / images[0].width)
        rows = (len(images) + cols - 1) // cols

        sheet = Image.new("RGB", (cols * thumb_w, rows * thumb_h), (24, 24, 24))

        for i, img in enumerate(images):
            thumb = img.resize((thumb_w, thumb_h), Image.Resampling.LANCZOS)
            x = (i % cols) * thumb_w
            y = (i // cols) * thumb_h
            sheet.paste(thumb, (x, y))

        if len(segments) == 1:
            out_path = output_dir / f"{stem}_storyboard.jpg"
        else:
            out_path = output_dir / f"{stem}_part_{seg_idx:02d}_storyboard.jpg"

        sheet.save(out_path, quality=90)
        saved.append(out_path)
        print(f"Сториборд: {len(seg_frames)} кадров → {out_path.name}")

    return saved


def parse_args() -> argparse.Namespace:
    p = argparse.ArgumentParser(
        description="Делает раскадровку видео и собирает рваное таймлапс-видео из кадров."
    )
    p.add_argument("video", type=Path, help="Исходное видео")
    p.add_argument(
        "-O",
        "--output-dir",
        type=Path,
        default=None,
        help="Папка для итоговых видео (по умолчанию: рядом с исходником)",
    )
    p.add_argument(
        "-i",
        "--interval",
        type=float,
        default=0.25,
        help="Интервал между кадрами в секундах (меньше = больше кадров). По умолчанию: 0.25",
    )
    p.add_argument(
        "--hold",
        type=float,
        default=0.1,
        help="Сколько секунд держать каждый кадр в итоговом видео. По умолчанию: 0.1",
    )
    p.add_argument(
        "--frames-dir",
        type=Path,
        default=None,
        help="Базовая папка для кадров по частям (по умолчанию: frames_<имя_видео>/part_NN)",
    )
    p.add_argument(
        "--keep-frames",
        action="store_true",
        help="Не удалять папки с кадрами после сборки",
    )
    p.add_argument(
        "--storyboard",
        action="store_true",
        help="Сохранить раскадровку на листах A4 (по 12 кадров на лист)",
    )
    p.add_argument(
        "--contact-sheet",
        action="store_true",
        help="Сториборд-сетка на тёмном фоне (как storyboard.jpg)",
    )
    p.add_argument(
        "--sheet-cols",
        type=int,
        default=6,
        help="Колонок в contact sheet. По умолчанию: 6",
    )
    p.add_argument(
        "--storyboard-only",
        action="store_true",
        help="Только раскадровка, без сборки видео",
    )
    p.add_argument(
        "--audio",
        action="store_true",
        help="Добавить оригинальную аудиодорожку (обрежется по длине видео)",
    )
    p.add_argument(
        "--per-page",
        type=int,
        default=FRAMES_PER_PAGE,
        help="Кадров на одном листе A4. По умолчанию: 12",
    )
    p.add_argument(
        "--storyboard-dir",
        type=Path,
        default=None,
        help="Папка для листов A4 (по умолчанию: storyboard_<имя_видео>)",
    )
    return p.parse_args()


def main() -> int:
    args = parse_args()
    video = args.video.resolve()

    if not video.is_file():
        print(f"Файл не найден: {video}", file=sys.stderr)
        return 1

    if shutil.which("ffmpeg") is None or shutil.which("ffprobe") is None:
        print("Нужен ffmpeg (и ffprobe) в PATH.", file=sys.stderr)
        return 1

    if args.interval <= 0 or args.hold <= 0:
        print("--interval и --hold должны быть > 0.", file=sys.stderr)
        return 1

    stem = video.stem
    output_dir = (args.output_dir or video.parent).resolve()
    frames_base = (args.frames_dir or video.parent / f"frames_{stem}").resolve()
    raw_frames_dir = frames_base / "_raw"

    duration = probe_duration(video)
    print(f"Исходное видео: {video.name} ({duration:.2f} с)")

    if frames_base.exists():
        for child in frames_base.iterdir():
            if child.is_dir():
                shutil.rmtree(child, ignore_errors=True)
            elif child.name.startswith("frame_") and child.suffix == ".jpg":
                child.unlink()

    if raw_frames_dir.exists():
        shutil.rmtree(raw_frames_dir, ignore_errors=True)

    print(f"Извлекаю кадр каждые {args.interval} с → {raw_frames_dir}")
    frames = extract_frames(video, raw_frames_dir, args.interval)
    print(f"Извлечено кадров: {len(frames)}")

    indexed_segments = split_into_segments_with_indices(frames)
    black_count = len(frames) - sum(len(seg) for _, seg in indexed_segments)

    if not indexed_segments:
        print("Предупреждение: после фильтра чёрных кадров не осталось содержимого.")
        shutil.rmtree(raw_frames_dir, ignore_errors=True)
        return 1

    print(f"Частей в видео: {len(indexed_segments)} (убрано чёрных вставок: {black_count})")

    segments: list[list[Path]] = []
    for part_idx, (indices, seg_frames) in enumerate(indexed_segments, 1):
        part_tag = f"part_{part_idx:02d}"
        part_frames_dir = frames_base / part_tag
        part_frames = write_segment_frames(seg_frames, part_frames_dir)
        segments.append(part_frames)

        out_duration = len(part_frames) * args.hold
        out_video = output_dir / f"{stem}_{part_tag}_raskadrovka.mp4"
        audio_start = audio_duration = None
        if args.audio:
            audio_start, audio_duration = segment_audio_range(indices, args.interval)

        print(
            f"Часть {part_idx}: {len(part_frames)} кадров, "
            f"≈ {out_duration:.2f} с → {out_video.name}"
        )
        if not args.storyboard_only:
            assemble_video(
                part_frames_dir,
                out_video,
                args.hold,
                audio_source=video if args.audio else None,
                audio_start=audio_start,
                audio_duration=audio_duration,
            )
            print(f"  кадры: {part_frames_dir}")
            print(f"  видео: {out_video}")
        else:
            print(f"  кадры: {part_frames_dir}")

    shutil.rmtree(raw_frames_dir, ignore_errors=True)

    sheet_dir = (args.storyboard_dir or video.parent).resolve()
    if args.contact_sheet:
        make_contact_sheet(
            segments,
            sheet_dir,
            stem,
            cols=args.sheet_cols,
        )

    if args.storyboard:
        storyboard_dir = (args.storyboard_dir or video.parent / f"storyboard_{stem}").resolve()
        cols = PAGE_COLS
        rows = PAGE_ROWS
        if args.per_page != FRAMES_PER_PAGE:
            # для другого числа кадров — подбираем сетку автоматически
            for c in range(1, args.per_page + 1):
                if args.per_page % c == 0:
                    cols = c
                    rows = args.per_page // c
            if cols * rows != args.per_page:
                cols, rows = 4, (args.per_page + 3) // 4
        make_a4_storyboard(
            segments,
            storyboard_dir,
            per_page=args.per_page,
            cols=cols,
            rows=rows,
        )

    if not args.keep_frames:
        shutil.rmtree(frames_base, ignore_errors=True)
        print(f"Папки с кадрами удалены: {frames_base}")
    else:
        print(f"Кадры по частям сохранены: {frames_base}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())

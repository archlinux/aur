#!/usr/bin/env python3
"""
Собирает видео из отсканированных PDF-раскадровок (12 кадров на лист).

Обрезка: сетка 3×4, поворот на 90° (горизонтально), обрезка в 16:9.

Пример:
  python scan_to_video.py doc1.pdf doc2.pdf
  python scan_to_video.py scans/*.pdf --hold 0.12 --preview
"""

from __future__ import annotations

import argparse
import shutil
import subprocess
import sys
from pathlib import Path

import numpy as np
from PIL import Image
from scipy import ndimage


GRID_COLS = 3
GRID_ROWS = 4
FRAMES_PER_PAGE = GRID_COLS * GRID_ROWS
OUTPUT_SIZE = (1280, 720)
PREVIEW_COLS = 4


def run(cmd: list[str]) -> None:
    print("→", " ".join(cmd))
    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0:
        if result.stderr:
            print(result.stderr, file=sys.stderr)
        raise RuntimeError(f"Ошибка ({result.returncode}): {' '.join(cmd)}")


def render_pdf(pdf: Path, dpi: int, dest_dir: Path) -> list[Path]:
    dest_dir.mkdir(parents=True, exist_ok=True)
    prefix = dest_dir / "page"
    run(["pdftoppm", "-png", "-r", str(dpi), str(pdf), str(prefix)])
    pages = sorted(dest_dir.glob("page-*.png"))
    if not pages:
        raise RuntimeError(f"Не удалось отрендерить PDF: {pdf}")
    return pages


def _merge_nearby(indices: list[int], min_dist: int) -> list[int]:
    if not indices:
        return []
    merged = [indices[0]]
    for idx in indices[1:]:
        if idx - merged[-1] < min_dist:
            merged[-1] = (merged[-1] + idx) // 2
        else:
            merged.append(idx)
    return merged


def _grid_lines(length: int, count: int, projection: np.ndarray) -> list[int]:
    """Границы ячеек: ищем белые просветы между кадрами."""
    smooth = ndimage.uniform_filter1d(projection.astype(np.float64), size=max(5, length // 80))
    valleys: list[tuple[float, int]] = []
    for i in range(1, len(smooth) - 1):
        if smooth[i] < 0.045 and smooth[i] <= smooth[i - 1] and smooth[i] <= smooth[i + 1]:
            valleys.append((smooth[i], i))
    valleys.sort(key=lambda item: item[0])

    needed = count + 1
    if len(valleys) >= needed - 2:
        chosen = sorted(idx for _, idx in valleys[: needed + 2])
        chosen = _merge_nearby(chosen, max(8, length // (count * 3)))
        if len(chosen) >= needed - 2:
            lines = [0] + chosen + [length]
            # берём равномерно распределённые границы
            if len(lines) > needed + 1:
                step = (len(lines) - 1) / count
                pick = [lines[int(round(i * step))] for i in range(count + 1)]
                pick[0], pick[-1] = 0, length
                return pick
            return lines[: needed + 1]

    # fallback: равномерная сетка с полями
    margin = int(length * 0.06)
    usable = length - 2 * margin
    step = usable / count
    return [int(margin + i * step) for i in range(count + 1)] + [length]


def auto_cell_boxes(
    gray: np.ndarray, cols: int, rows: int
) -> list[tuple[int, int, int, int]]:
    height, width = gray.shape
    y0, y1 = int(height * 0.06), int(height * 0.96)
    x0, x1 = int(width * 0.02), int(width * 0.98)
    region = gray[y0:y1, x0:x1]

    col_proj = (region < 190).mean(axis=0)
    row_proj = (region < 190).mean(axis=1)
    xs = _grid_lines(region.shape[1], cols, col_proj)
    ys = _grid_lines(region.shape[0], rows, row_proj)

    boxes: list[tuple[int, int, int, int]] = []
    for row in range(rows):
        for col in range(cols):
            bx0 = x0 + xs[col]
            bx1 = x0 + xs[col + 1]
            by0 = y0 + ys[row]
            by1 = y0 + ys[row + 1]
            boxes.append((bx0, by0, bx1, by1))
    return boxes


def detect_grid(gray: np.ndarray) -> tuple[int, int]:
    """Подбирает сетку: на портретном скане раскадровка 3×4."""
    height, width = gray.shape
    candidates = [(3, 4), (4, 3), (2, 6)] if height >= width else [(4, 3), (3, 4), (6, 2)]

    best_cols, best_rows = candidates[0]
    best_score = -1.0
    for cols, rows in candidates:
        if cols * rows != FRAMES_PER_PAGE:
            continue
        boxes = auto_cell_boxes(gray, cols, rows)
        scores = [
            (gray[b[1] : b[3], b[0] : b[2]] < 200).mean()
            for b in boxes
        ]
        good = sum(0.22 < s < 0.92 for s in scores)
        empty = sum(s < 0.12 for s in scores)
        score = good - empty * 0.6
        if height >= width and cols == 3 and rows == 4:
            score += 0.5
        if score > best_score:
            best_score = score
            best_cols, best_rows = cols, rows
    return best_cols, best_rows


def _fit_16_9(img: Image.Image) -> Image.Image:
    cw, ch = img.size
    target_ar = 16 / 9
    ar = cw / ch
    if ar > target_ar:
        new_w = int(ch * target_ar)
        xoff = (cw - new_w) // 2
        return img.crop((xoff, 0, xoff + new_w, ch))
    new_h = int(cw / target_ar)
    yoff = (ch - new_h) // 2
    return img.crop((0, yoff, cw, yoff + new_h))


def extract_frame(
    gray: np.ndarray,
    cell: tuple[int, int, int, int],
    target: tuple[int, int] = OUTPUT_SIZE,
    *,
    rotate: int = -90,
) -> Image.Image | None:
    x0, y0, x1, y1 = cell
    # небольшой отступ от линий сетки
    pad_in = max(4, int(min(x1 - x0, y1 - y0) * 0.02))
    x0 += pad_in
    y0 += pad_in
    x1 -= pad_in
    y1 -= pad_in

    patch = gray[y0:y1, x0:x1].astype(np.float32)
    h, w = patch.shape
    if h < 20 or w < 20:
        return None

    # убираем полоску с номерами внизу
    content = patch.copy()
    content[int(h * 0.8) :, :] = 255

    threshold = float(np.percentile(content, 32))
    dark = content < threshold
    dark = ndimage.binary_opening(dark, iterations=1)
    dark = ndimage.binary_closing(dark, iterations=2)

    labeled, count = ndimage.label(dark)
    if count == 0:
        return None

    sizes = ndimage.sum(dark, labeled, range(1, count + 1))
    largest = 1 + int(np.argmax(sizes))
    mask = labeled == largest

    ys, xs = np.where(mask)
    pad = max(2, int(min(w, h) * 0.01))
    bx0 = max(0, int(xs.min()) - pad)
    bx1 = min(w, int(xs.max()) + pad + 1)
    by0 = max(0, int(ys.min()) - pad)
    by1 = min(int(h * 0.82), int(ys.max()) + pad + 1)

    crop = patch[by0:by1, bx0:bx1]
    if crop.shape[0] < 10 or crop.shape[1] < 10:
        return None

    img = Image.fromarray(np.clip(crop, 0, 255).astype(np.uint8)).convert("RGB")

    # на скане кадры лежат вертикально — поворачиваем в горизонталь
    if rotate and img.height >= img.width * 0.9:
        img = img.rotate(rotate, expand=True, resample=Image.Resampling.BICUBIC)

    img = _fit_16_9(img)
    return img.resize(target, Image.Resampling.LANCZOS)


def extract_frames_from_page(
    page: Path,
    frames_dir: Path,
    *,
    cols: int | None = None,
    rows: int | None = None,
    rotate: int = -90,
) -> list[Path]:
    gray = np.array(Image.open(page).convert("L"))
    if cols is None or rows is None:
        det_cols, det_rows = detect_grid(gray)
        cols = cols or det_cols
        rows = rows or det_rows
        print(f"  сетка: {cols}×{rows}")

    boxes = auto_cell_boxes(gray, cols, rows)

    frames_dir.mkdir(parents=True, exist_ok=True)
    saved: list[Path] = []

    for i, cell in enumerate(boxes, 1):
        x0, y0, x1, y1 = cell
        patch = gray[y0:y1, x0:x1]
        if patch.size == 0 or (patch < 200).mean() < 0.12:
            print(f"  ячейка {i}: пусто, пропуск")
            continue

        frame = extract_frame(gray, cell, rotate=rotate)
        if frame is None:
            print(f"  предупреждение: кадр {i} не найден на {page.name}")
            continue
        out = frames_dir / f"frame_{len(saved) + 1:04d}.jpg"
        frame.save(out, quality=92)
        saved.append(out)

    return saved


def assemble_video(frames_dir: Path, output: Path, hold: float) -> None:
    fps = 1.0 / hold
    run(
        [
            "ffmpeg",
            "-y",
            "-framerate",
            f"{fps:.6f}",
            "-i",
            str(frames_dir / "frame_%04d.jpg"),
            "-c:v",
            "libx264",
            "-pix_fmt",
            "yuv420p",
            "-crf",
            "18",
            "-an",
            str(output),
        ]
    )


def save_preview(frames: list[Path], output: Path, cols: int = PREVIEW_COLS) -> None:
    if not frames:
        return
    fw, fh = Image.open(frames[0]).size
    rows = (len(frames) + cols - 1) // cols
    sheet = Image.new("RGB", (fw * cols, fh * rows), (24, 24, 24))
    for i, path in enumerate(frames):
        sheet.paste(Image.open(path), ((i % cols) * fw, (i // cols) * fh))
    output.parent.mkdir(parents=True, exist_ok=True)
    sheet.save(output, quality=90)


def process_pdf(
    pdf: Path,
    output_dir: Path,
    *,
    hold: float,
    dpi: int,
    cols: int | None,
    rows: int | None,
    rotate: int,
    preview: bool,
    keep_frames: bool,
) -> list[Path]:
    stem = pdf.stem
    work_dir = output_dir / f"_work_{stem}"
    if work_dir.exists():
        shutil.rmtree(work_dir)

    pages = render_pdf(pdf, dpi, work_dir / "pages")
    videos: list[Path] = []

    for page_idx, page in enumerate(pages, 1):
        tag = f"{stem}_page_{page_idx:02d}" if len(pages) > 1 else stem
        frames_dir = work_dir / f"frames_{page_idx:02d}"
        frames = extract_frames_from_page(
            page, frames_dir, cols=cols, rows=rows, rotate=rotate
        )

        if not frames:
            print(f"  {pdf.name}: на странице {page_idx} нет кадров")
            continue

        print(f"  страница {page_idx}: извлечено {len(frames)} кадров")

        if preview:
            preview_path = output_dir / f"{tag}_preview.jpg"
            save_preview(frames, preview_path)
            print(f"  превью: {preview_path.name}")

        out_video = output_dir / f"{tag}_from_scan.mp4"
        assemble_video(frames_dir, out_video, hold)
        videos.append(out_video)
        print(f"  видео: {out_video.name} ({len(frames) * hold:.2f} с)")

        if keep_frames:
            dest = output_dir / f"frames_{tag}"
            if dest.exists():
                shutil.rmtree(dest)
            shutil.copytree(frames_dir, dest)
            print(f"  кадры: {dest}")

    shutil.rmtree(work_dir, ignore_errors=True)
    return videos


def parse_args() -> argparse.Namespace:
    p = argparse.ArgumentParser(
        description="Собирает видео из отсканированных PDF-раскадровок (12 кадров на лист)."
    )
    p.add_argument("pdfs", nargs="+", type=Path, help="PDF-файлы со сканами")
    p.add_argument(
        "-O",
        "--output-dir",
        type=Path,
        default=None,
        help="Папка для результатов (по умолчанию: рядом с первым PDF)",
    )
    p.add_argument(
        "--hold",
        type=float,
        default=0.1,
        help="Секунд на кадр в видео. По умолчанию: 0.1",
    )
    p.add_argument(
        "--dpi",
        type=int,
        default=300,
        help="DPI при рендере PDF. По умолчанию: 300",
    )
    p.add_argument(
        "--cols",
        type=int,
        default=None,
        help="Колонок на листе (по умолчанию: авто, обычно 3)",
    )
    p.add_argument(
        "--rows",
        type=int,
        default=None,
        help="Рядов на листе (по умолчанию: авто, обычно 4)",
    )
    p.add_argument(
        "--rotate",
        type=int,
        default=-90,
        help="Поворот кадра в градусах (по умолчанию: -90, по часовой → горизонтально)",
    )
    p.add_argument(
        "--no-rotate",
        action="store_true",
        help="Не поворачивать кадры",
    )
    p.add_argument(
        "--preview",
        action="store_true",
        help="Сохранить превью извлечённых кадров",
    )
    p.add_argument(
        "--keep-frames",
        action="store_true",
        help="Сохранить извлечённые jpg-кадры",
    )
    return p.parse_args()


def main() -> int:
    args = parse_args()

    if shutil.which("ffmpeg") is None or shutil.which("pdftoppm") is None:
        print("Нужны ffmpeg и pdftoppm (poppler).", file=sys.stderr)
        return 1

    if args.hold <= 0:
        print("--hold должен быть > 0.", file=sys.stderr)
        return 1

    pdfs = [p.resolve() for p in args.pdfs]
    for pdf in pdfs:
        if not pdf.is_file():
            print(f"Файл не найден: {pdf}", file=sys.stderr)
            return 1

    output_dir = (args.output_dir or pdfs[0].parent).resolve()
    output_dir.mkdir(parents=True, exist_ok=True)

    rotate = 0 if args.no_rotate else args.rotate

    all_videos: list[Path] = []
    for pdf in pdfs:
        print(f"\n{pdf.name}")
        videos = process_pdf(
            pdf,
            output_dir,
            hold=args.hold,
            dpi=args.dpi,
            cols=args.cols,
            rows=args.rows,
            rotate=rotate,
            preview=args.preview,
            keep_frames=args.keep_frames,
        )
        all_videos.extend(videos)

    print(f"\nГотово: {len(all_videos)} видео в {output_dir}")
    for v in all_videos:
        print(f"  {v.name}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())

"""Extract photo frames from contact-sheet scans and assemble a video."""

from __future__ import annotations

import argparse
from pathlib import Path

import cv2
import imageio.v3 as iio
import numpy as np


ANALYSIS_SCALE = 0.05


def _blur_1d(signal: np.ndarray, ksize: int) -> np.ndarray:
    return cv2.GaussianBlur(signal.reshape(-1, 1).astype(np.float32), (1, ksize), 0).ravel()


def _segments(active: np.ndarray, min_width: int) -> list[tuple[int, int]]:
    segments: list[tuple[int, int]] = []
    i = 0
    n = len(active)
    while i < n:
        if active[i]:
            j = i
            while j < n and active[j]:
                j += 1
            if j - i >= min_width:
                segments.append((i, j))
            i = j
        else:
            i += 1
    return segments


def detect_columns(gray_small: np.ndarray, full_width: int) -> list[tuple[int, int]]:
    dark = (gray_small < 195).astype(np.uint8)
    col = _blur_1d(dark.sum(axis=0).astype(np.float32), 15)
    peak = float(col.max())
    min_width = max(8, int(gray_small.shape[1] * 0.08))
    segments = _segments(col > peak * 0.08, min_width)

    min_photo_width = full_width * 0.12
    columns: list[tuple[int, int]] = []
    for x0, x1 in segments:
        full_x0 = int(x0 / ANALYSIS_SCALE)
        full_x1 = int(x1 / ANALYSIS_SCALE)
        if full_x1 - full_x0 >= min_photo_width:
            columns.append((full_x0, full_x1))
    return columns


def _find_valleys(signal: np.ndarray, min_distance: int, min_prominence_frac: float) -> list[tuple[int, float]]:
    smoothed = _blur_1d(signal, 31)
    inverted = smoothed.max() - smoothed
    prominence_min = float(inverted.max()) * min_prominence_frac
    candidates: list[tuple[int, float]] = []
    for i in range(1, len(inverted) - 1):
        if inverted[i] >= inverted[i - 1] and inverted[i] > inverted[i + 1]:
            if inverted[i] >= prominence_min:
                candidates.append((i, float(inverted[i])))
    candidates.sort(key=lambda item: item[1], reverse=True)

    chosen: list[tuple[int, float]] = []
    for y, depth in candidates:
        if all(abs(y - other_y) >= min_distance for other_y, _ in chosen):
            chosen.append((y, depth))
    chosen.sort(key=lambda item: item[0])
    return chosen


def select_row_dividers(
    valleys: list[tuple[int, float]],
    top: int,
    bottom: int,
    rows: int,
) -> list[int]:
    needed = rows - 1
    if needed <= 0:
        return []

    margin = int((bottom - top) * 0.07)
    inner_top = top + margin
    inner_bottom = bottom - margin
    candidates = [(y, depth) for y, depth in valleys if inner_top < y < inner_bottom]
    if len(candidates) <= needed:
        return [y for y, _ in candidates]

    target = (inner_bottom - inner_top) / rows
    best_combo: tuple[int, ...] | None = None
    best_score = -1.0

    from itertools import combinations

    for combo in combinations(candidates, needed):
        ys = sorted(y for y, _ in combo)
        bounds = [inner_top, *ys, inner_bottom]
        heights = [bounds[i + 1] - bounds[i] for i in range(rows)]
        evenness = 1.0 / (1.0 + float(np.std(heights)))
        depth_score = float(np.mean([depth for y, depth in combo]))
        score = evenness * 0.65 + (depth_score / max(d[1] for d in candidates)) * 0.35
        if score > best_score:
            best_score = score
            best_combo = tuple(ys)

    return list(best_combo or tuple(y for y, _ in candidates[:needed]))


def detect_photos_in_column(
    gray: np.ndarray,
    x0: int,
    x1: int,
) -> list[tuple[int, int, int, int]]:
    """Find individual dark photos inside one column via connected components."""
    roi = gray[:, x0:x1]
    h, w = roi.shape[:2]
    blur = cv2.GaussianBlur(roi, (5, 5), 0)
    _, bw = cv2.threshold(blur, 0, 255, cv2.THRESH_BINARY_INV + cv2.THRESH_OTSU)
    bw[roi > 175] = 0
    # Gaps between prints are tiny (~15–40px); keep the kernel smaller than that.
    k = cv2.getStructuringElement(cv2.MORPH_RECT, (5, 5))
    mask = cv2.morphologyEx(bw, cv2.MORPH_CLOSE, k, iterations=1)
    mask = cv2.morphologyEx(mask, cv2.MORPH_OPEN, k, iterations=1)

    n_labels, _, stats, _ = cv2.connectedComponentsWithStats(mask)
    min_area = h * w * 0.03
    # One print ≈ col_w * 1.5 tall — never accept a 2–3 frame merge.
    max_h = int(w * 2.15)
    max_area = min(h * w * 0.45, max_h * w)
    min_h = int(h * 0.04)
    min_w = int(w * 0.35)
    boxes: list[tuple[int, int, int, int]] = []
    for i in range(1, n_labels):
        x, y, bw_w, bw_h, area = (int(v) for v in stats[i])
        if area < min_area or area > max_area:
            continue
        if bw_h < min_h or bw_w < min_w:
            continue
        if bw_h > max_h:
            continue
        fill = area / max(bw_w * bw_h, 1)
        if fill < 0.35:
            continue
        boxes.append((x0 + x, y, bw_w, bw_h))
    boxes.sort(key=lambda b: b[1])
    return boxes


def _cells_look_sane(cells: list[tuple[int, int, int, int]], n_columns: int) -> bool:
    if not cells:
        return False
    heights = [h for _, _, _, h in cells]
    widths = [w for _, _, w, _ in cells]
    med_h = float(np.median(heights))
    med_w = float(np.median(widths))
    if med_w < 1:
        return False
    # Any merged strip left?
    if any(h > med_w * 2.3 for h in heights):
        return False
    if any(h > med_h * 1.85 for h in heights):
        return False
    # Contact sheets have ≥2 prints per column. Sparse CC results (e.g. one
    # blob per column on a 3×4 sheet) look "sane" individually but miss rows.
    if len(cells) < max(2, n_columns * 2):
        return False
    return True


def detect_grid(
    image: np.ndarray,
    rows: int | None = None,
    *,
    major: str = "column",
    h_dir: str = "ltr",
    v_dir: str = "ttb",
) -> list[tuple[int, int, int, int]]:
    h, w = image.shape[:2]
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    small = cv2.resize(
        gray,
        (int(w * ANALYSIS_SCALE), int(h * ANALYSIS_SCALE)),
        interpolation=cv2.INTER_AREA,
    )

    columns = detect_columns(small, w)
    if not columns:
        return []

    inset_x = int(w * 0.008)
    inset_y = int(h * 0.004)

    def _order(cells: list[tuple[int, int, int, int]]) -> list[tuple[int, int, int, int]]:
        return sort_grid(cells, major=major, h_dir=h_dir, v_dir=v_dir)

    def _from_row_bounds(row_mode: int | None) -> list[tuple[int, int, int, int]]:
        out: list[tuple[int, int, int, int]] = []
        for col_x0, col_x1 in columns:
            row_bounds = detect_row_bounds(small, col_x0, col_x1, h, rows=row_mode)
            for row_y0, row_y1 in row_bounds:
                x_start = col_x0 + inset_x
                x_end = col_x1 - inset_x
                y_start = row_y0 + inset_y
                y_end = row_y1 - inset_y
                if x_end - x_start > 20 and y_end - y_start > 20:
                    # Skip absurdly tall slices (failed split).
                    if (y_end - y_start) > (x_end - x_start) * 2.3:
                        continue
                    out.append((x_start, y_start, x_end - x_start, y_end - y_start))
        return out

    if rows is None:
        cells: list[tuple[int, int, int, int]] = []
        for col_x0, col_x1 in columns:
            cells.extend(detect_photos_in_column(gray, col_x0, col_x1))
        if _cells_look_sane(cells, len(columns)):
            return _order(cells)
        # Fallback: brightness valleys / equal split per column.
        cells = _from_row_bounds(None)
        if cells:
            return _order(cells)

    return _order(_from_row_bounds(rows))


def detect_row_bounds(
    gray_small: np.ndarray,
    x0: int,
    x1: int,
    full_height: int,
    rows: int | None = None,
) -> list[tuple[int, int]]:
    sx0 = int(x0 * ANALYSIS_SCALE)
    sx1 = int(x1 * ANALYSIS_SCALE)
    roi = gray_small[:, sx0:sx1]
    row_mean = roi.mean(axis=1).astype(np.float32)
    row_signal = float(row_mean.max()) - row_mean
    smoothed = _blur_1d(row_signal, 21)

    active = smoothed > smoothed.max() * 0.12
    ys = np.where(active)[0]
    if ys.size == 0:
        return [(0, full_height)]

    top = int(ys[0] / ANALYSIS_SCALE)
    bottom = int(ys[-1] / ANALYSIS_SCALE)
    active_h = max(1, bottom - top)
    col_w = max(1, x1 - x0)

    if rows is None:
        expected_h = col_w * 1.4
        rows = max(1, int(round(active_h / expected_h)))

    min_distance = max(6, int(gray_small.shape[0] * 0.06))
    valleys = _find_valleys(row_signal, min_distance=min_distance, min_prominence_frac=0.03)
    full_valleys = [(int(y / ANALYSIS_SCALE), depth) for y, depth in valleys]
    dividers = select_row_dividers(full_valleys, top, bottom, rows)

    if len(dividers) < rows - 1:
        step = active_h / rows
        dividers = [int(top + step * i) for i in range(1, rows)]

    bounds = [top, *dividers, bottom]
    row_boxes: list[tuple[int, int]] = []
    for i in range(len(bounds) - 1):
        y0, y1 = bounds[i], bounds[i + 1]
        if y1 - y0 > full_height * 0.03:
            row_boxes.append((y0, y1))
    return row_boxes


def _cluster_1d(
    cells: list[tuple[int, int, int, int]],
    *,
    axis: str,
) -> list[list[tuple[int, int, int, int]]]:
    """Group cells into columns (axis='x') or rows (axis='y') by center proximity."""
    if not cells:
        return []
    if axis == "x":
        key = lambda c: c[0] + c[2] / 2
        gap = float(np.median([w for _, _, w, _ in cells])) * 0.55
    else:
        key = lambda c: c[1] + c[3] / 2
        gap = float(np.median([h for _, _, _, h in cells])) * 0.55

    ordered = sorted(cells, key=key)
    groups: list[list[tuple[int, int, int, int]]] = []
    centers: list[float] = []
    for cell in ordered:
        center = key(cell)
        placed = False
        for idx, gc in enumerate(centers):
            if abs(center - gc) < gap:
                groups[idx].append(cell)
                centers[idx] = float(np.mean([key(c) for c in groups[idx]]))
                placed = True
                break
        if not placed:
            groups.append([cell])
            centers.append(center)

    # Stable left→right / top→bottom group order by center.
    order = np.argsort(centers)
    return [groups[i] for i in order]


def sort_grid(
    cells: list[tuple[int, int, int, int]],
    *,
    major: str = "column",
    h_dir: str = "ltr",
    v_dir: str = "ttb",
) -> list[tuple[int, int, int, int]]:
    """Order contact-sheet cells for playback.

    major: 'column' = down each column then next; 'row' = across each row then next.
    h_dir: 'ltr' left→right, 'rtl' right→left (which edge starts / column order).
    v_dir: 'ttb' top→bottom, 'btt' bottom→top (which edge starts / row order).
    """
    if not cells:
        return []
    major = major if major in ("column", "row") else "column"
    h_dir = h_dir if h_dir in ("ltr", "rtl") else "ltr"
    v_dir = v_dir if v_dir in ("ttb", "btt") else "ttb"
    x_rev = h_dir == "rtl"
    y_rev = v_dir == "btt"

    ordered: list[tuple[int, int, int, int]] = []
    if major == "column":
        columns = _cluster_1d(cells, axis="x")
        if x_rev:
            columns = list(reversed(columns))
        for col in columns:
            col_sorted = sorted(col, key=lambda c: c[1], reverse=y_rev)
            ordered.extend(col_sorted)
    else:
        rows = _cluster_1d(cells, axis="y")
        if y_rev:
            rows = list(reversed(rows))
        for row in rows:
            row_sorted = sorted(row, key=lambda c: c[0], reverse=x_rev)
            ordered.extend(row_sorted)
    return ordered


def sort_grid_column_major(
    cells: list[tuple[int, int, int, int]],
) -> list[tuple[int, int, int, int]]:
    """Default: columns left→right, within each top→bottom."""
    return sort_grid(cells, major="column", h_dir="ltr", v_dir="ttb")


def _longest_active_span(active: np.ndarray) -> tuple[int, int] | None:
    """Return [start, end) of the longest True run, or None."""
    best: tuple[int, int] | None = None
    start: int | None = None
    n = len(active)
    for i, is_on in enumerate(active):
        if is_on and start is None:
            start = i
        elif not is_on and start is not None:
            if best is None or i - start > best[1] - best[0]:
                best = (start, i)
            start = None
    if start is not None:
        if best is None or n - start > best[1] - best[0]:
            best = (start, n)
    return best


def _density_bbox(mask: np.ndarray, min_frac: float) -> tuple[int, int, int, int] | None:
    """Tight bbox from row/col dark-pixel density (longest contiguous run)."""
    row_frac = mask.mean(axis=1)
    col_frac = mask.mean(axis=0)
    row_span = _longest_active_span(row_frac > min_frac)
    col_span = _longest_active_span(col_frac > min_frac)
    if row_span is None or col_span is None:
        return None
    y0, y1 = row_span
    x0, x1 = col_span
    if y1 - y0 < 8 or x1 - x0 < 8:
        return None
    return x0, y0, x1 - x0, y1 - y0


def _eat_bright_edges(
    gray: np.ndarray,
    x0: int,
    y0: int,
    x1: int,
    y1: int,
    *,
    dark_thr: int = 185,
    min_dark_frac: float = 0.50,
    max_mean: float = 160.0,
) -> tuple[int, int, int, int]:
    """Shrink bbox while border lines are still mostly paper."""
    while y1 - y0 > 16:
        line = gray[y0, x0:x1]
        if (line < dark_thr).mean() >= min_dark_frac and float(line.mean()) <= max_mean:
            break
        y0 += 1
    while y1 - y0 > 16:
        line = gray[y1 - 1, x0:x1]
        if (line < dark_thr).mean() >= min_dark_frac and float(line.mean()) <= max_mean:
            break
        y1 -= 1
    while x1 - x0 > 16:
        line = gray[y0:y1, x0]
        if (line < dark_thr).mean() >= min_dark_frac and float(line.mean()) <= max_mean:
            break
        x0 += 1
    while x1 - x0 > 16:
        line = gray[y0:y1, x1 - 1]
        if (line < dark_thr).mean() >= min_dark_frac and float(line.mean()) <= max_mean:
            break
        x1 -= 1
    return x0, y0, x1, y1


def fill_paper_fringe(
    image: np.ndarray,
    bright_thr: int = 175,
    band_frac: float = 0.10,
) -> np.ndarray:
    """Inpaint scanner-paper fringe connected to the frame border."""
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    h, w = gray.shape[:2]
    bright = gray >= bright_thr

    walkable = bright.astype(np.uint8)
    walkable[0, :] = 1
    walkable[-1, :] = 1
    walkable[:, 0] = 1
    walkable[:, -1] = 1
    work = walkable * 255
    ff_mask = np.zeros((h + 2, w + 2), np.uint8)
    seeds = (
        [(x, 0) for x in range(w)]
        + [(x, h - 1) for x in range(w)]
        + [(0, y) for y in range(h)]
        + [(w - 1, y) for y in range(h)]
    )
    for x, y in seeds:
        if ff_mask[y + 1, x + 1] == 0 and work[y, x] > 0:
            cv2.floodFill(work, ff_mask, (x, y), 128, flags=4 | (255 << 8))

    flooded = ff_mask[1:-1, 1:-1] > 0
    paper = flooded & bright
    max_depth = max(12, int(min(h, w) * band_frac))
    ys, xs = np.indices((h, w))
    dist_edge = np.minimum(np.minimum(ys, h - 1 - ys), np.minimum(xs, w - 1 - xs))
    paper &= dist_edge <= max_depth
    if not paper.any():
        return image

    mask = cv2.dilate(paper.astype(np.uint8) * 255, np.ones((5, 5), np.uint8), iterations=2)
    mask[dist_edge > max_depth + 4] = 0
    filled = cv2.inpaint(image, mask, 9, cv2.INPAINT_TELEA)

    gray2 = cv2.cvtColor(filled, cv2.COLOR_BGR2GRAY)
    pale = gray2 >= 155
    walkable2 = pale.astype(np.uint8)
    walkable2[0, :] = 1
    walkable2[-1, :] = 1
    walkable2[:, 0] = 1
    walkable2[:, -1] = 1
    work2 = walkable2 * 255
    ff2 = np.zeros((h + 2, w + 2), np.uint8)
    for x, y in seeds:
        if ff2[y + 1, x + 1] == 0 and work2[y, x] > 0:
            cv2.floodFill(work2, ff2, (x, y), 128, flags=4 | (255 << 8))
    paper2 = (ff2[1:-1, 1:-1] > 0) & pale & (dist_edge <= max(8, max_depth // 2))
    if paper2.any():
        mask2 = cv2.dilate(paper2.astype(np.uint8) * 255, np.ones((3, 3), np.uint8), iterations=1)
        filled = cv2.inpaint(filled, mask2, 5, cv2.INPAINT_TELEA)
    return filled


def refine_crop(crop: np.ndarray) -> np.ndarray:
    """Trim paper margins tightly around the photo content."""
    gray = cv2.cvtColor(crop, cv2.COLOR_BGR2GRAY)
    h, w = gray.shape[:2]
    blur = cv2.GaussianBlur(gray, (5, 5), 0)
    _, bw = cv2.threshold(blur, 0, 255, cv2.THRESH_BINARY_INV + cv2.THRESH_OTSU)
    bw[gray >= 210] = 0

    k = max(9, (int(min(h, w) * 0.025) | 1))
    kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (k, k))
    mask = cv2.morphologyEx(bw, cv2.MORPH_CLOSE, kernel, iterations=2)
    mask = cv2.morphologyEx(mask, cv2.MORPH_OPEN, kernel, iterations=1)

    box: tuple[int, int, int, int] | None = None
    n_labels, labels, stats, _ = cv2.connectedComponentsWithStats(mask)
    if n_labels > 1:
        areas = stats[1:, cv2.CC_STAT_AREA]
        idx = 1 + int(np.argmax(areas))
        if stats[idx, cv2.CC_STAT_AREA] >= h * w * 0.12:
            component = (labels == idx).astype(np.float32)
            tight = _density_bbox(component, min_frac=0.22)
            if tight is not None:
                box = tight
            else:
                x, y, bw_w, bw_h = (int(v) for v in stats[idx, :4])
                box = (x, y, bw_w, bw_h)

    if box is None:
        dark = (gray < 200).astype(np.float32)
        box = _density_bbox(dark, min_frac=0.22)
        if box is None:
            return fill_paper_fringe(crop)

    x0, y0, bw_w, bw_h = box
    x1, y1 = x0 + bw_w, y0 + bw_h
    x0, y0, x1, y1 = _eat_bright_edges(gray, x0, y0, x1, y1)
    if y1 - y0 < 16 or x1 - x0 < 16:
        return fill_paper_fringe(crop)
    # Crease highlights must not destroy most of the frame.
    if (y1 - y0) * (x1 - x0) < h * w * 0.55:
        return fill_paper_fringe(crop)
    return fill_paper_fringe(crop[y0:y1, x0:x1])


def load_image(path: Path, pdf_dpi: int = 300) -> np.ndarray:
    """Load a raster scan or render the first page of a PDF."""
    if path.suffix.lower() == ".pdf":
        import fitz

        doc = fitz.open(path)
        if len(doc) == 0:
            raise FileNotFoundError(path)
        page = doc[0]
        mat = fitz.Matrix(pdf_dpi / 72, pdf_dpi / 72)
        pix = page.get_pixmap(matrix=mat, alpha=False)
        rgb = np.frombuffer(pix.samples, dtype=np.uint8).reshape(pix.height, pix.width, 3)
        return cv2.cvtColor(rgb, cv2.COLOR_RGB2BGR)

    image = cv2.imread(str(path))
    if image is None:
        raise FileNotFoundError(path)
    return image


def is_photo_crop(crop: np.ndarray, min_dark_frac: float = 0.20) -> bool:
    """Reject empty / mostly-paper cells / merged column strips."""
    if crop.size == 0 or crop.shape[0] < 16 or crop.shape[1] < 16:
        return False
    h, w = crop.shape[:2]
    if h > w * 2.3:
        return False
    gray = cv2.cvtColor(crop, cv2.COLOR_BGR2GRAY)
    return float((gray < 180).mean()) >= min_dark_frac


def apply_frame_transforms(
    frames: list[np.ndarray],
    rotate_cw: int = 0,
    reverse: bool = False,
) -> list[np.ndarray]:
    result = frames
    if reverse:
        result = list(reversed(result))
    if rotate_cw % 360 == 90:
        result = [cv2.rotate(frame, cv2.ROTATE_90_CLOCKWISE) for frame in result]
    elif rotate_cw % 360 == 180:
        result = [cv2.rotate(frame, cv2.ROTATE_180) for frame in result]
    elif rotate_cw % 360 == 270:
        result = [cv2.rotate(frame, cv2.ROTATE_90_COUNTERCLOCKWISE) for frame in result]
    return result


def crop_cells(image: np.ndarray, cells: list[tuple[int, int, int, int]]) -> list[np.ndarray]:
    crops: list[np.ndarray] = []
    for x, y, w, h in cells:
        crop = image[y : y + h, x : x + w].copy()
        refined = refine_crop(crop)
        if is_photo_crop(refined):
            crops.append(refined)
    return crops


def resize_to_common(frames: list[np.ndarray]) -> list[np.ndarray]:
    if not frames:
        return []
    # Even sizes required by libx264 / yuv420p.
    target_h = int(np.median([f.shape[0] for f in frames])) & ~1
    target_w = int(np.median([f.shape[1] for f in frames])) & ~1
    target_h = max(2, target_h)
    target_w = max(2, target_w)

    # Also fit the larger aspect so nothing is crushed; letterbox on black.
    max_w = int(max(f.shape[1] for f in frames)) & ~1
    max_h = int(max(f.shape[0] for f in frames)) & ~1
    canvas_w = max(target_w, max_w)
    canvas_h = max(target_h, max_h)
    canvas_w = max(2, canvas_w & ~1)
    canvas_h = max(2, canvas_h & ~1)

    out: list[np.ndarray] = []
    for frame in frames:
        h, w = frame.shape[:2]
        scale = min(canvas_w / w, canvas_h / h)
        nw = max(2, int(round(w * scale)) & ~1)
        nh = max(2, int(round(h * scale)) & ~1)
        resized = cv2.resize(frame, (nw, nh), interpolation=cv2.INTER_AREA)
        canvas = np.zeros((canvas_h, canvas_w, 3), dtype=frame.dtype)
        y0 = (canvas_h - nh) // 2
        x0 = (canvas_w - nw) // 2
        canvas[y0 : y0 + nh, x0 : x0 + nw] = resized
        out.append(canvas)
    return out


def build_sequence(
    frames: list[np.ndarray],
    fps: float,
    hold_seconds: float,
    max_width: int | None = None,
) -> tuple[list[np.ndarray], float]:
    if not frames:
        raise ValueError("No frames to write")

    frames = resize_to_common(frames)
    rgb_frames = [cv2.cvtColor(f, cv2.COLOR_BGR2RGB) for f in frames]

    if max_width and rgb_frames[0].shape[1] > max_width:
        scale = max_width / rgb_frames[0].shape[1]
        target_w = max_width & ~1
        target_h = max(2, int(rgb_frames[0].shape[0] * scale) & ~1)
        rgb_frames = [
            cv2.resize(frame, (target_w, target_h), interpolation=cv2.INTER_AREA)
            for frame in rgb_frames
        ]

    hold_count = max(1, int(round(fps * hold_seconds)))
    sequence: list[np.ndarray] = []
    for frame in rgb_frames:
        sequence.extend([frame] * hold_count)
    return sequence, fps


def build_video(frames: list[np.ndarray], output: Path, fps: float, hold_seconds: float) -> None:
    sequence, fps = build_sequence(frames, fps=fps, hold_seconds=hold_seconds)
    iio.imwrite(
        output,
        sequence,
        fps=fps,
        codec="libx264",
        pixelformat="yuv420p",
        macro_block_size=1,
    )


def build_gif(
    frames: list[np.ndarray],
    output: Path,
    fps: float,
    hold_seconds: float,
    max_width: int = 720,
) -> None:
    sequence, fps = build_sequence(
        frames,
        fps=fps,
        hold_seconds=hold_seconds,
        max_width=max_width,
    )
    duration_ms = max(1, int(round(1000 / fps)))
    iio.imwrite(output, sequence, duration=duration_ms, loop=0)


# Per-file auto-rotate/reverse disabled — use UI «Поворот всех» or --rotate-all.
SCAN_POSTPROCESS: dict[str, dict[str, int | bool]] = {}


def process_scan(
    path: Path,
    rows: int | None = None,
    debug_dir: Path | None = None,
    rotate_cw: int = 0,
    reverse: bool = False,
    pdf_dpi: int = 300,
    *,
    major: str = "column",
    h_dir: str = "ltr",
    v_dir: str = "ttb",
) -> list[np.ndarray]:
    image = load_image(path, pdf_dpi=pdf_dpi)

    cells = detect_grid(image, rows=rows, major=major, h_dir=h_dir, v_dir=v_dir)
    crops = crop_cells(image, cells)
    crops = apply_frame_transforms(crops, rotate_cw=rotate_cw, reverse=reverse)

    if debug_dir:
        debug_dir.mkdir(parents=True, exist_ok=True)
        vis = image.copy()
        for i, (x, y, w, h) in enumerate(cells, start=1):
            cv2.rectangle(vis, (x, y), (x + w, y + h), (0, 255, 0), 8)
            cv2.putText(
                vis,
                str(i),
                (x + 20, y + 90),
                cv2.FONT_HERSHEY_SIMPLEX,
                2.5,
                (0, 255, 0),
                5,
            )
        cv2.imwrite(str(debug_dir / f"{path.stem}_boxes.png"), vis)
        for i, crop in enumerate(crops, start=1):
            cv2.imwrite(str(debug_dir / f"{path.stem}_{i:02d}.png"), crop)

    return crops


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--inputs",
        nargs="+",
        default=[
            "doc01192620260717040006.pdf",
            "DOC011~2.PDF",
        ],
        help="Scans in playback order (PNG/JPG/PDF)",
    )
    parser.add_argument("--output", default="output.mp4")
    parser.add_argument("--gif", default="output.gif", help="GIF output path")
    parser.add_argument("--fps", type=float, default=16.0)
    parser.add_argument("--hold", type=float, default=0.1, help="Seconds per frame")
    parser.add_argument("--gif-width", type=int, default=720, help="Max GIF width in pixels")
    parser.add_argument(
        "--rotate-all",
        type=int,
        default=0,
        help="Rotate every frame clockwise by this many degrees (0, 90, 180, 270)",
    )
    parser.add_argument(
        "--rows",
        type=int,
        default=0,
        help="Rows per contact sheet (0 = auto-detect per column)",
    )
    parser.add_argument("--pdf-dpi", type=int, default=300, help="Rasterize PDF at this DPI")
    parser.add_argument(
        "--order-major",
        choices=("column", "row"),
        default="column",
        help="Traverse by columns or by rows",
    )
    parser.add_argument(
        "--order-h",
        choices=("ltr", "rtl"),
        default="ltr",
        help="Horizontal: ltr=left→right, rtl=right→left",
    )
    parser.add_argument(
        "--order-v",
        choices=("ttb", "btt"),
        default="ttb",
        help="Vertical: ttb=top→bottom, btt=bottom→top",
    )
    parser.add_argument("--debug-dir", default="frames")
    args = parser.parse_args()

    debug_dir = Path(args.debug_dir)
    all_frames: list[np.ndarray] = []
    rows = None if args.rows <= 0 else args.rows

    for input_name in args.inputs:
        path = Path(input_name)
        post = SCAN_POSTPROCESS.get(path.name, {})
        frames = process_scan(
            path,
            rows=rows,
            debug_dir=debug_dir,
            rotate_cw=int(post.get("rotate_cw", 0)),
            reverse=bool(post.get("reverse", False)),
            pdf_dpi=args.pdf_dpi,
            major=args.order_major,
            h_dir=args.order_h,
            v_dir=args.order_v,
        )
        print(f"{path.name}: {len(frames)} frames")
        all_frames.extend(frames)

    if args.rotate_all:
        all_frames = apply_frame_transforms(all_frames, rotate_cw=args.rotate_all)

    for idx, frame in enumerate(all_frames, start=1):
        cv2.imwrite(str(debug_dir / f"sequence_{idx:02d}.png"), frame)

    output = Path(args.output)
    build_video(all_frames, output, fps=args.fps, hold_seconds=args.hold)
    print(f"Saved {len(all_frames)} frames -> {output}")

    gif_output = Path(args.gif)
    build_gif(
        all_frames,
        gif_output,
        fps=args.fps,
        hold_seconds=args.hold,
        max_width=args.gif_width,
    )
    print(f"Saved GIF -> {gif_output}")


if __name__ == "__main__":
    main()

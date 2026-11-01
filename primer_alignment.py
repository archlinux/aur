# SPDX-License-Identifier: BSD-3-Clause
"""The semi-global primer alignment mode needed with older scikit-bio."""
import numpy as np

from ._primer_alignment_c import _fill_affine_matrices, _trace_one_affine


def align_primer(primer, target, substitution_matrix):
    """Return score, target bounds and aligned strings, retaining penalized gaps.

    Match scikit-bio 0.7.2 pair_align_nucl with global mode, gap_cost=(5, 2),
    free_ends=(True, True, False, False), trim_ends=True and max_paths=1.
    Substitution-matrix rows represent primer symbols, columns target symbols.
    """
    primer, target = str(primer), str(target)
    if not primer or not target:
        raise ValueError('Primer and target must both be nonempty.')
    scores = np.asarray(substitution_matrix.scores)
    if scores.dtype not in (np.dtype('float32'), np.dtype('float64')):
        raise ValueError('Substitution scores must use float32 or float64.')
    alphabet = tuple(substitution_matrix.alphabet)
    if scores.shape != (len(alphabet), len(alphabet)):
        raise ValueError('Substitution scores must match the alphabet.')
    lookup = {symbol: index for index, symbol in enumerate(alphabet)}
    first = np.array([lookup[symbol] for symbol in primer], dtype=np.intp)
    second = np.array([lookup[symbol] for symbol in target], dtype=np.intp)
    profile = np.ascontiguousarray(scores[first])
    m, n = len(primer), len(target)
    main, insertion, deletion = (
        np.empty((m + 1, n + 1), dtype=scores.dtype) for _ in range(3))
    gap_open, gap_extend = scores.dtype.type(5), scores.dtype.type(2)
    main[0, :] = 0
    main[1:, 0] = -gap_extend * np.arange(1, m + 1, dtype=scores.dtype)
    main[1:, 0] -= gap_open
    insertion[1:, 0] = -np.inf
    deletion[0, 1:] = -np.inf
    _fill_affine_matrices(main, insertion, deletion, profile, second,
                          gap_open, gap_extend, False)

    # First argmax keeps the smallest target stop among tied optimal scores.
    stop = int(main[m].argmax())
    score = main[m, stop]
    path = np.empty(m + n, dtype=np.uint8)
    pos, i, start = _trace_one_affine(
        path, m + n, m, stop, main, insertion, deletion,
        gap_extend, False, scores.dtype.type(1e-5))
    # Free leading primer gaps are trimmed. Penalized leading target gaps stay.
    if i:
        pos -= i
        path[pos:pos + i] = 2
    first_pos, second_pos = 0, start
    aligned_primer, aligned_target = [], []
    for state in path[pos:]:
        if state == 1:
            aligned_primer.append('-')
        else:
            aligned_primer.append(primer[first_pos])
            first_pos += 1
        if state == 2:
            aligned_target.append('-')
        else:
            aligned_target.append(target[second_pos])
            second_pos += 1
    assert first_pos == m and second_pos == stop
    return (float(score), start, stop,
            ''.join(aligned_primer), ''.join(aligned_target))

"""Check native alignments against exhaustive paths on small deterministic inputs."""
from itertools import combinations
from pathlib import Path
import sys

import numpy as np
import torch
import monotonic_align
from monotonic_align import mask_from_len, mask_from_lens, maximum_path

assert Path(monotonic_align.__file__).is_relative_to(sys.prefix)
assert monotonic_align.__version__ == '1.2'
checked = 0
for dtype in (torch.float32, torch.float64):
    for symbols, frames in ((1, 1), (1, 5), (2, 5), (3, 6), (4, 8)):
        values = torch.arange(symbols * frames, dtype=dtype).reshape(1, symbols, frames)
        values = ((values * 17 + 3) % 29 - 14) / 8
        original = values.clone()
        scores = []
        for moves in combinations(range(1, frames), symbols - 1):
            states = [sum(point <= frame for point in moves) for frame in range(frames)]
            scores.append(sum(float(values[0, state, frame]) for frame, state in enumerate(states)))
        expected = max(scores)
        paths = []
        for topology in ('1-step', '1-step-alt'):
            path, accumulated = maximum_path(values, topology=topology, output_scores=True)
            assert path.dtype == dtype and path.device == values.device
            assert torch.equal(values, original)
            assert torch.all((path == 0) | (path == 1))
            assert torch.all(path.sum(dim=1) == 1)
            states = path[0].argmax(dim=0)
            assert int(states[0]) == 0 and int(states[-1]) == symbols - 1
            assert torch.all((states.diff() == 0) | (states.diff() == 1))
            assert float((path * values).sum()) == expected
            assert float(accumulated[0, symbols - 1, frames - 1]) == expected
            paths.append(path)
            checked += 1
        assert torch.equal(*paths)

values = torch.full((2, 4, 8), -20.0)
values[0, 0, :2] = 5
values[0, 2, 2:6] = 5
values[1, 0, :2] = 5
values[1, 2, 2:6] = 5
values[1, 3, 6:] = 5
lengths = torch.tensor([3, 4])
frames = torch.tensor([6, 8])
mask = mask_from_lens(values, lengths, frames)
assert torch.equal(mask_from_len(lengths, 4), torch.tensor([[True, True, True, False], [True, True, True, True]]))
assert mask.sum(dim=(1, 2)).tolist() == [18, 32]
for topology in ('2-step', '2-epsilon'):
    path, accumulated = maximum_path(values, mask, topology=topology, output_scores=True)
    assert np.isfinite(accumulated).all()
    assert torch.count_nonzero(path * (1 - mask)) == 0
    assert path[0, :, :6].argmax(dim=0).tolist() == [0, 0, 2, 2, 2, 2]
    assert path[1].argmax(dim=0).tolist() == [0, 0, 2, 2, 2, 2, 3, 3]
    assert (path * values).sum(dim=(1, 2)).tolist() == [30, 40]
    checked += 2
try:
    maximum_path(values, mask, topology='invalid')
except ValueError:
    checked += 1
else:
    raise AssertionError('Unknown topology accepted')
print(f'PASS: {checked} alignment checks, four native topologies, exhaustive optimality and masks')

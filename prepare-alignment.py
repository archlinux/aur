# SPDX-License-Identifier: BSD-3-Clause
"""Retain only the two required functions from the pinned upstream engine."""
from pathlib import Path
import sys

source, destination = map(Path, sys.argv[1:])
text = source.read_text()
# Preserve the upstream copyright, compiler directives and fused abs helper.
prefix = text[:text.index('cdef inline floating lbound(')]
blocks = []
for name in ('_fill_affine_matrices', '_trace_one_affine'):
    marker = '\ndef ' + name + '('
    assert text.count(marker) == 1
    start = text.index(marker) + 1
    end = text.find('\ndef ', start)
    assert end > start
    blocks.append(text[start:end])
destination.write_text(
    prefix + '# Upstream LICENSE.txt is preserved as scikit-bio-LICENSE.txt.\n\n'
    + '\n'.join(blocks))

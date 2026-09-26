# Test helper copied from nibabel (nibabel/streamlines/tests/test_tractogram.py).
#
# trx-python's test suite imports make_dummy_streamline from nibabel's own
# test suite, which Arch's python-nibabel does not install. This copy is used
# only in check() and is not installed.
#
# The MIT License
#
# Copyright (c) 2009-2019 Matthew Brett <matthew.brett@gmail.com>
# Copyright (c) 2010-2013 Stephan Gerhard <git@unidesign.ch>
# Copyright (c) 2006-2014 Michael Hanke <michael.hanke@gmail.com>
# Copyright (c) 2011 Christian Haselgrove <christian.haselgrove@umassmed.edu>
# Copyright (c) 2010-2011 Jarrod Millman <jarrod.millman@gmail.com>
# Copyright (c) 2011-2019 Yaroslav Halchenko <debian@onerussian.com>
# Copyright (c) 2015-2019 Chris Markiewicz <effigies@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

import numpy as np


def make_dummy_streamline(nb_points):
    """Make the streamlines that have been used to create test data files."""
    if nb_points == 1:
        streamline = np.arange(1 * 3, dtype='f4').reshape((1, 3))
        data_per_point = {
            'fa': np.array([[0.2]], dtype='f4'),
            'colors': np.array([(1, 0, 0)] * 1, dtype='f4'),
        }
        data_for_streamline = {
            'mean_curvature': np.array([1.11], dtype='f4'),
            'mean_torsion': np.array([1.22], dtype='f4'),
            'mean_colors': np.array([1, 0, 0], dtype='f4'),
            'clusters_labels': np.array([0, 1], dtype='i4'),
        }

    elif nb_points == 2:
        streamline = np.arange(2 * 3, dtype='f4').reshape((2, 3))
        data_per_point = {
            'fa': np.array([[0.3], [0.4]], dtype='f4'),
            'colors': np.array([(0, 1, 0)] * 2, dtype='f4'),
        }
        data_for_streamline = {
            'mean_curvature': np.array([2.11], dtype='f4'),
            'mean_torsion': np.array([2.22], dtype='f4'),
            'mean_colors': np.array([0, 1, 0], dtype='f4'),
            'clusters_labels': np.array([2, 3, 4], dtype='i4'),
        }

    elif nb_points == 5:
        streamline = np.arange(5 * 3, dtype='f4').reshape((5, 3))
        data_per_point = {
            'fa': np.array([[0.5], [0.6], [0.6], [0.7], [0.8]], dtype='f4'),
            'colors': np.array([(0, 0, 1)] * 5, dtype='f4'),
        }
        data_for_streamline = {
            'mean_curvature': np.array([3.11], dtype='f4'),
            'mean_torsion': np.array([3.22], dtype='f4'),
            'mean_colors': np.array([0, 0, 1], dtype='f4'),
            'clusters_labels': np.array([5, 6, 7, 8], dtype='i4'),
        }

    return streamline, data_per_point, data_for_streamline

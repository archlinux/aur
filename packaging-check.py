# SPDX-License-Identifier: 0BSD
"""Packaging checks, not an upstream test suite."""
from pathlib import Path
import sys
import unittest

site = Path(sys.argv.pop(1)).resolve()
sys.path.insert(0, str(site))
import torch
import einops_exts
from einops import EinopsError
from einops_exts import (
    check_shape, rearrange_many, reduce_many, repeat_many,
    rearrange_with_anon_dims, reduce_with_anon_dims, repeat_with_anon_dims,
)
from einops_exts.torch import EinopsToAndFrom

assert Path(einops_exts.__file__).resolve().is_relative_to(site)
torch.set_num_threads(2)


class PackagingChecks(unittest.TestCase):
    def test_shape_validation(self):
        x = torch.arange(24).reshape(2, 3, 4)
        torch.testing.assert_close(check_shape(x, 'b c n', c=3), x)
        with self.assertRaises(EinopsError):
            check_shape(x, 'b c n', c=5)

    def test_multiple_tensors(self):
        xs = [torch.arange(24).reshape(2, 3, 4).float(), torch.ones(2, 3, 4)]
        for actual, x in zip(rearrange_many(xs, 'b c n -> b n c'), xs):
            torch.testing.assert_close(actual, x.transpose(1, 2))
        for actual, x in zip(reduce_many(xs, 'b c n -> b c', reduction='mean'), xs):
            torch.testing.assert_close(actual, x.mean(dim=2))
        for actual, x in zip(repeat_many(xs, 'b c n -> b c n r', r=2), xs):
            torch.testing.assert_close(actual, x.unsqueeze(-1).expand(2, 3, 4, 2))

    def test_anonymous_dimensions(self):
        x = torch.arange(24).reshape(2, 12).float()
        y = rearrange_with_anon_dims(x, 'b (...axes) -> b ...axes', axes=(3, 4))
        torch.testing.assert_close(y, x.reshape(2, 3, 4))
        reduced = reduce_with_anon_dims(y, 'b ...axes -> b', reduction='sum', axes=(3, 4))
        torch.testing.assert_close(reduced, x.sum(dim=1))
        repeated = repeat_with_anon_dims(x, 'b n -> b n ...copies', copies=(2, 3))
        torch.testing.assert_close(repeated, x[:, :, None, None].expand(2, 12, 2, 3))
        with self.assertRaises(AssertionError):
            rearrange_with_anon_dims(x, 'b (...missing) -> b ...missing')

    def test_module_wrapper_and_gradient(self):
        linear = torch.nn.Linear(3, 3, bias=False, dtype=torch.float64)
        with torch.no_grad():
            linear.weight.copy_(torch.diag(torch.tensor([1., 2., 3.], dtype=torch.float64)))
        x = torch.arange(48, dtype=torch.float64).reshape(2, 3, 2, 4).requires_grad_()
        module = EinopsToAndFrom('b c ...', 'b ... c', linear)
        actual = module(x)
        scale = torch.tensor([1., 2., 3.], dtype=torch.float64).reshape(1, 3, 1, 1)
        torch.testing.assert_close(actual, x * scale)
        actual.sum().backward()
        torch.testing.assert_close(x.grad, scale.expand_as(x))
        identity = EinopsToAndFrom('b c h w', 'b (h w) c', torch.nn.Identity())
        torch.testing.assert_close(identity(x.detach()), x.detach())


unittest.main(verbosity=2)

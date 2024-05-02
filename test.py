#!/usr/bin/env python

import torch

d = torch.device('cuda')
a = torch.rand(1, 2).to(d)
print(a + 0)

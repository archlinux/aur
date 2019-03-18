#!/usr/bin/env python
# coding=utf8
# Fixes the 'fontname' property of the MonacoB2 font family
# so that Nerd Fonts patcher can generate all fonts correctly

import sys, re, fontforge

font = fontforge.open(sys.argv[1])

print(font.fontname)

if re.match(r"^MonacoB(?:-Bold)?$", font.fontname):
    font.fontname = font.fontname.replace("MonacoB", "MonacoB2")
    font.generate(sys.argv[1])

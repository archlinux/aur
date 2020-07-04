#!/usr/bin/env python
# coding=utf8
# Fixes the 'fontname' property of the MonacoB2 font family
# so that Nerd Fonts patcher can generate all fonts correctly

import os, sys, re, fontforge

script_name = os.path.basename(__file__)

try:
    font_path = sys.argv[1]
    pretty_path = "{}/{}".format(os.path.basename(os.path.dirname(font_path)), os.path.basename(font_path))

    print(">>> {}: [{}] Opening font file...".format(script_name, pretty_path))

    font = fontforge.open(font_path)
except:
    sys.exit(">>> {}: Error: Unable to open font file!".format(script_name))

# This font in specific has the weight and the fullname properties set incorrectly
if font.fontname == "MonacoBItalic":
    new_name = "MonacoB-Italic"
    font.weight = "Italic"
else:
    new_name = "{}-{}".format(font.fullname.split(" ")[0], font.weight)

print(">>> {}: [{}] Renaming font: '{}' -> '{}'".format(script_name, pretty_path, font.fontname, new_name))
print(">>> {}: [{}] Fixing font properties...".format(script_name, pretty_path))

font.fontname = new_name
font.fullname = new_name

print(">>> {}: [{}] Overwriting font...".format(script_name, pretty_path))

font.generate(font_path)

print(">>> {}: [{}] Done!".format(script_name, pretty_path))

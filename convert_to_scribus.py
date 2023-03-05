"""Converts a Colornerd library to XML-based Scribus swatches."""

import json
import re
import sys
from typing import TextIO

import xmltodict

CSS_HASH_PATTERN = re.compile(r"#([0-9a-fA-F]{6})")
CSS_RGB_PATTERN = re.compile(r"rgb\((\d+),\s*(\d+),\s*(\d+)\)")

def _scribus_swatch(source: dict[str, str]) -> dict[str, str]:
    match source["hex"]:
        case str(color) if (match := CSS_HASH_PATTERN.search(color)):
            rgb = bytes.fromhex(match[1])
        case str(color) if (match := CSS_RGB_PATTERN.fullmatch(color)):
            rgb = match.groups()
        case str(unknown_format):
            raise ValueError(unknown_format)
    return {
        "@NAME": source["name"],
        "@SPACE": "RGB",
        "@R": rgb[0],
        "@G": rgb[1],
        "@B": rgb[2],
        "@Spot": "1",
    }

def to_scribus_swatches(color_json: TextIO) -> str:
    """Converts a Colornerd library to a Scribus XML string."""
    return xmltodict.unparse(
        {
            "SCRIBUSCOLORS": {
                "COLOR": [
                    _scribus_swatch(color) for color in json.load(color_json)
                ]
            }
        },
        pretty = True,
    )

if __name__ == '__main__':
    print(to_scribus_swatches(sys.stdin))

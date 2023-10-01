#!/usr/bin/env python

from argparse import ArgumentParser
from dataclasses import dataclass
import os
from typing import Optional
from pathlib import Path
import tempfile
import subprocess

import sexpdata
from sexpdata import Symbol


@dataclass
class SymbolInfo:
    name: str
    description: Optional[str] = None
    datasheet: Optional[str] = None
    image: Optional[str] = None


@dataclass
class FootprintInfo:
    name: str
    description: Optional[str] = None
    image: Optional[str] = None


def get_symbols(filename):
    with open(filename, "r") as fobj:
        data = sexpdata.loads(fobj.read())

    symbols = []

    symbol_defs = [x for x in data if x[0] == Symbol("symbol")]
    for symbol_def in symbol_defs:
        symbol_info = SymbolInfo(name=str(symbol_def[1]))
        for child in symbol_def:
            if child[0] == Symbol("property"):
                if child[1] == "ki_description":
                    symbol_info.description = child[2]
                if child[1] == "Datasheet":
                    symbol_info.datasheet = child[2]
        symbols.append(symbol_info)

    return symbols


def get_descr(filename):
    with open(filename, "r") as fobj:
        data = sexpdata.loads(fobj.read())

    for prop in data:
        if prop[0] == Symbol("descr"):
            return prop[1]


def extract_symbol_libraries(symbols_dir: Path, images_dir: Path):
    libs = {}

    for symbol_file in symbols_dir.glob("*.kicad_sym"):
        print(f"* Extracting symbols from {symbol_file}")
        lib = []
        svg_dir = images_dir / symbol_file.name
        subprocess.call(
            [
                "kicad-cli",
                "sym",
                "export",
                "svg",
                symbol_file,
                "-o",
                svg_dir,
                # "--black-and-white",
            ]
        )
        for symbol in get_symbols(symbol_file):
            image_noext = str(svg_dir / symbol.name.lower())
            if not Path(image_noext + ".svg").exists():
                image_noext += "_1"
            print(f"  - Rendering image for {symbol_file}")
            subprocess.call(
                [
                    "convert",
                    "-density",
                    "300",
                    image_noext + ".svg",
                    image_noext + ".png",
                ]
            )
            symbol.image = image_noext + ".png"
            lib.append(symbol)
        for svg in svg_dir.glob("*.svg"):
            svg.unlink()
        libs[symbol_file.name] = lib
    return libs


def extract_footprint_libraries(footprints_dir: Path, images_dir: Path):
    libs = {}

    for lib_dir in footprints_dir.glob("*.pretty"):
        print(f"* Extracting footprints from {lib_dir}")
        lib = []
        svg_dir = images_dir / lib_dir.name
        subprocess.call(
            [
                "kicad-cli",
                "fp",
                "export",
                "svg",
                lib_dir,
                "-o",
                svg_dir,
                "--black-and-white",
            ]
        )
        for fp_file in lib_dir.glob("*.kicad_mod"):
            descr = get_descr(fp_file)
            image_noext = str(svg_dir / fp_file.stem)
            print(f"  - Rendering image for {fp_file}")
            subprocess.call(
                [
                    "convert",
                    "-density",
                    "300",
                    image_noext + ".svg",
                    image_noext + ".png",
                ]
            )
            lib.append(
                FootprintInfo(
                    name=fp_file.stem, description=descr, image=image_noext + ".png"
                )
            )
        for svg in svg_dir.glob("*.svg"):
            svg.unlink()
        libs[lib_dir.name] = lib
    return libs


def main(symbols_dir: Path, footprints_dir: Path, images_dir: Path, readme_file: Path):
    Path(images_dir).mkdir(parents=True, exist_ok=True)

    symbol_libraries = extract_symbol_libraries(symbols_dir, images_dir)
    footprint_libraries = extract_footprint_libraries(footprints_dir, images_dir)

    with readme_file.open("w") as fobj:
        print("# Symbols", file=fobj)
        print(file=fobj)
        for lib_name, symbols in symbol_libraries.items():
            print(f"## {lib_name}", file=fobj)
            print(file=fobj)
            print("| Image | Symbol name | Datasheet | Description |", file=fobj)
            print("| --- | --- | --- | --- |", file=fobj)
            for symbol in symbols:
                print(
                    f"![{symbol.name}]({symbol.image}) | {symbol.name} | {symbol.datasheet} | {symbol.description}",
                    file=fobj,
                )
            print(file=fobj)

        print("# Footprints", file=fobj)
        print(file=fobj)
        for lib_name, footprints in footprint_libraries.items():
            print(f"## {lib_name}", file=fobj)
            print(file=fobj)
            print("| Image | Footprint name | Description |", file=fobj)
            print("| --- | --- | --- |", file=fobj)
            for footprint in footprints:
                print(
                    f"![{footprint.name}]({footprint.image}) | {footprint.name} | {footprint.description}",
                    file=fobj,
                )
            print(file=fobj)


if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument("symbols_dir", help="Directory containing KiCad symbol files")
    parser.add_argument(
        "footprints_dir", help="Directory containing KiCad footprint files"
    )
    parser.add_argument("images_dir", help="Directory to write images to")
    parser.add_argument("readme_file", help="Destination README.md file")
    args = parser.parse_args()
    main(
        Path(args.symbols_dir),
        Path(args.footprints_dir),
        Path(args.images_dir),
        Path(args.readme_file),
    )

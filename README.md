# Universal IFR Extractor for Linux

A command line port of metacollins' Universal IFR Extractor for macOS, ported to work on Linux.

Utility that can extract the internal forms representation (IFR) from both EFI and UEFI modules and convert it into a human-readable format.

© Original work by 2014 donovan6000

macOS port by metacollin, 2016

Ported to Linux by TGSoftware from metacollins' port, 2016

## Changelog

Initial release (11/27/2016)

## Build Instructions

Install the `cmake` (version 2.8+) and `clang` packages on Linux.

Run these commands in a shell/terminal:

``` sh
git clone https://github.com/TGSoftware/Universal-IFR-Extractor.git
cd Universal-IFR-Extractor
mkdir build && cd build
cmake ..
make
```

This will produce an executable called `ifrextract`.  It has no external files or dependencies, so feel free to copy it to your `/usr/local/bin` $PATH directory or simply run it in the directory it was built in (`./ifrextract`).

## Usage

From the location of the built binary:

``` sh
./ifrextract input_file # Will check the file type and output UEFI, EFI, or UNKNOWN

./ifrextract input_file output_file # Will proceed with generating a human readable extraction.
```

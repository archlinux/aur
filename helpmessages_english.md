# English translation of the help messages of the software at https://github.com/forth32/balong-nvtool.

## `README.md`:

Hisilicon Balong NVRAM image editing utility.

This utility can read and edit NVRAM images. Both NVRAM file (nv.bin) and NVRAM parititions (nvdload, nvdefault, nvbacklte) are supported. "nvimg" is a file partition with jffs/yaffs file system and is not suitale for editing directly. You should extract "nv.bin" from it first. This file is usually available inside the device as `/mnvm2:0/nv.bin`.

One can get NVRAM image contents, extract all or selected NVRAM items and component files. It's also possible to edit any NVRAM item or load it from external file. The program contains names for all known NVRAM items.  
There's also v4 OEM and SIMLOCK code brute force functionality.

`modem-bin` directory contains binary files for the on-device Linux. It can edit `/mnvm2:0/nv.bin` file directly and correctly recalculate all checksums.

This software is in Russian only. Use machine translation if needed.  
Please ask questions only about the program itself. No questions about devices, boot pins, loaders, NVRAM backups allowed.


## `install.txt`:

The libmd cryptography support library must be installed on the system before building the program. On debian-compatible systems this library is installed from the `libmd-dev` package.


## Output of `balong-nvtool`:

```
 - Not an nvram image file, use the -h key for prompting
```


## Output of `balong-nvtool -h`:

```
A utility for editing NVRAM images of chipset devices  
Hisilicon Balong, V1.0.215 (c) forth32, 2016, GNU GPLv3
-------------------------------------------------------------------

 Command line format:

./balong-nvtool [options] <name of NVRAM image file>

 The following options are allowed:

-l                        - print the NVRAM image map
-u                        - print unique identifiers and settings
-e                        - extract all cells
-x item                   - extract item cell to the file
-d item                   - dump the item cell (d* - all cells)
-r item:file              - replace the item cell with the contents of the file file
-m item[+off]:nn[:nn...]  - replace bytes in item+offset with bytes specified in the command
-a item[+off]:text        - write a text line to item+offset
                            * If +off is not specified then replacement begins from zero byte.
                              The offset is given in hex.
-i imei                   - write new IMEI
-s serial                 - write new serial number
-c                        - extract all component files
-k n                      - extract all cells related to the component n to the COMPn directory
-w dir                    - import the cell contents from the dir/ directory files
-b oem|simlock|all        - select OEM, SIMLOCK or both codes
```


## Output of `nvdload-combine`/ `nvdload-combine -h`:

```
! No filenames for combining are specified
Command line format:

  ./nvdload-combine nvimg-file xml-file

The output file is nvdload.nvd
```


## Output of `nvdload-split`:

```
 NVRAM partition file name not specified
```


## Output of `nvdload-split -h`:

```
 Error opening file -h
```

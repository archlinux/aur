#qhuaweiflash
Graphical utility for flashing HUAWEI modems and routers and editing firmware files

This utility is intended for:

- Firmware for Huawei modems that support a firmware protocol similar to that used in modems based on Balong V7. This includes full-fledged work with digital signatures of firmware.
- Editing firmware images. You can view, add, delete, change individual sections, change section headings.
Editing of partition images in HEX code and, partially, in format mode (if the partition has any meaningful format) has been implemented.
- Loading usbloader loaders into the modem using patches.

The utility is built on the Qt graphics package, and is a windowed version of the balong_flash, balong-usbload utilities, and also a firmware editor.

To build ctilita use the commands:

qmake

make

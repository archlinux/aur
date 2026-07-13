# linux-vfio

## What is this?

`linux-vfio` is the kernel for Arch linux with the ACS Override patch applied.  The patch was originally written by Alex Williamson to allow certain motherboards to split PCIe IOMMU groups where it would not otherwise be possible.  This is often used to allow a specific PCIe card (often a video card) to be assigned to the `vfio` driver, and attached to a virtual machine.

## Original patches

* [LKML: ACS Override](https://lkml.org/lkml/2013/5/30/513)
* ~~[LKML: i915 VGA Arbiter](https://lkml.org/lkml/2014/5/9/517)~~

## See Also

* [ArchWiki: PCI passthrough via OVMF](https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF)
* [VFIO Kernel Documentation](https://www.kernel.org/doc/Documentation/vfio.txt)

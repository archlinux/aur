mkinitcpio TPM2 hook
====================

This mkinitcpio hook allows for an encrypted root device to use a key sealed by
a TPM 2.0. It should be placed immediately before the `encrypt` hook in
`/etc/mkinitcpio.conf`.

    HOOKS="base udev ... block tpm2 encrypt filesystems 

The `tpm2` hook attempts to "unseal" a LUKS keyfile previously sealed by the
TPM. The sealed files must reside on an unencrypted filesystem available to the
kernel at boot or may be stored in TPM non-volatile memory (NVRAM). For example,
assuming your unencrypted keyfile is at `/root/mykey` and a primary TPM key has
been persisted to `0x81000001`:

    # tpm2_createpolicy -P -L sha1:0,2,4,7 -f pcr.pol -T device:/dev/tpmrm0
    # tpm2_create -H 0x81000001 -g sha256 -G keyedhash -A 0x492 -I /root/mykey \
      -L pcr.pol -r /boot/mykey.priv -u /boot/mykey.pub -T device:/dev/tpmrm0

After generating a TPM-sealed key, both `tpmkey` and `tpmpcr` should be specified
on the kernel command line.

The `tpmkey` parameter has several formats:

    tpmkey=[device]:[path]:[handle]
    tpmkey=[device]:[publicpath]:[privatepath]:[handle]
    tpmkey=nvram:[index]
    tpmkey=nvram:[index]:[offset]:[size]

Where `[device]` represents the raw block device on which the key exists,
`[path]` is the absolute base path of the sealed files within the device, and
`[handle]` is the TPM handle of the key's parent object. If only `[path]` is
specified, '.pub' and '.priv' will be appended to the path to locate the public
and private files, respectively. The absolute `[publicpath]` and `[privatepath]`
can be specified separately if needed. For example, if `/dev/sda1` is an EFI
partition mounted at `/boot`:

    tpmkey=/dev/sda1:/mykey:0x81000001

Setting `[device]` to 'nvram' indicates that the key is stored in TPM NVRAM. In
this case `[index]` is the NVRAM area index, `[offset]` is the offset of the key
in bytes and `[size]` is the size of the key in bytes.

The `tpmpcr` parameter should hold the TPM2 PCR bank specification that will
unlock the sealed key.

    tpmpcr=sha1:0,2,7

Multiple specs can be separated by a '|' and key decryption will be attempted
with each set of banks.

    tpmpcr=sha1:0,2,4,7|sha1:0,2,7

Instead of a bank specification, the first item in the `tpmpcr` parameter may be
used to indicate a PCR to extend _after_ the key has been unsealed.

    extend:[pcrnum]:[alg]

Where `[pcrnum]` is the PCR number to extend and `[alg]` is the bank algorithm.
For example, to extend PCR 8 in the sha1 bank:

    tpmpcr=extend:8:sha1|sha1:0,2,7

You may also need to add the `vfat` file system driver to the `MODULES` array:

    MODULES=(vfat)

Finally, rebuild the initramfs:

    # mkinitcpio -p linux

During boot, the hook will initialize the TPM and attempt to unseal the key. If
the key is successfully unsealed, it will be passed to the `encrypt` hook to
perform the actual decryption of the root file system.

Depending on the PCR banks to which the sealed key is bound, system changes such
as kernel updates or firmware adjustments may prevent the key from being
unsealed. If this happens, the disk must be manually unlocked with a passphrase
and a new sealed key file needs to be generated. For this reason, it is CRUCIAL
to add a separate "recovery" passphrase to the LUKS keys.

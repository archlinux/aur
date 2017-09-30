mkinitcpio TPM hook
===================

This hook allows for an encrypted root device to use a keyfile sealed by the
TPM. It should be placed immediately before the `encrypt` hook in
`/etc/mkinitcpio.conf`.

    HOOKS="base udev ... block tpm encrypt filesystems ..."

The `tpm` hook attempts to "unseal" a dm-crypt keyfile previously sealed by the
TPM. This file must reside on an unencrypted filesystem available to the kernel
at boot. For example, assuming your unencrypted keyfile is at `/root/mykey`:

    # tpm_sealdata -i /root/mykey -o /boot/mykey.enc -p 0 -p 1 -p 2 -p 3 -p 5 -p 7 -p 8

After generating a TPM-sealed keyfile, 'tpmkey=device:fstype:path' should be
specified on the kernel cmdline, where 'device' represents the raw block device
where the key exists, 'fstype' is the filesystem type of 'device' (or auto),
and 'path' is the absolute path of the keyfile within the device. For example,
if `/dev/sda1` is an EFI partition mounted at `/boot`:

    tpmkey=/dev/sda1:vfat:/mykey.enc

You may also need to add the file system driver to the `MODULES` array:

    MODULES="vfat"

Finally, rebuild the initramfs:

    # mkinitcpio -p linux

During boot, the hook will initialize the TPM and attempt to unseal the keyfile.
If the SRK is protected by a passphrase, you will be prompted to enter it. If
the file is successfully unsealed, it will be passed to the `encrypt` hook to
perform the actual unlocking of the root fs.

Depending on the PCRs the sealed keyfile is bound to, system changes such as
kernel updates or firmware adjustments may prevent the file from being unsealed.
If this happens, the disk must be manually unlocked with a passphrase and a new
sealed key file needs to be generated. For this reason, it is CRUCIAL to add
a separate "recovery" passphrase to the LUKS keys.

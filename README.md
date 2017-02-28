LUKS TPM
========

A small utility script to manage LUKS keyfiles sealed by a TPM.

This script assumes you will be using a TPM-sealed keyfile during boot to unlock
the root file system. It is intended to be used as part of your kernel update
process to generate a keyfile sealed against the new kernel's PCR values.

Update Process
--------------

The script facilitates te following kernel update process:

  1. Kernel is updated
  2. `luks-tpm` is called, either manually or via pacman hook, and sets a
     temporary LUKS passphrase
  3. The system is rebooted into the new kernel
  4. Because the TPM PCRs have changed, the old keyfile cannot be unsealed
  5. User enters the temporary passphrase to unlock the disk
  6. `luks-tpm` is called, generating a new keyfile sealed by the TPM and
     removing the temporary passphrase

###LUKS Key Slots

The script requires two LUKS key slots to function: one for the sealed keyfile
and one for the temporary passphrase. You are also *strongly* encouraged to
dedicate an additional slot for a recovery passphrase not managed by `luks-tpm`.

The default key slot layout is:

  * Slot 0: Recovery passphrase (optional)
  * Slot 1: TPM keyfile
  * Slot 2: Temporary passphrase

Usage
-----

    luks-tpm [OPTION]... DEVICE ACTION

###Actions
  * `temp`: Set a temporary LUKS passphrase
  * `reset`: Regenerate the LUKS TPM key and remove the temporary passphrase

###Options
    -h         Print help
    -m PATH    Mount point for the tmpfs file system used to store TPM keyfiles
               Default: /root/keyfs
    -k PATH    Sealed TPM keyfile path
               Default: /boot/keyfile.enc
    -t NUMBER  LUKS slot number for the TPM keyfile
               Default: 1
    -r NUMBER  LUKS slot number for temporary reset passphrase
               Default: 2
    -p NUMBER  PCRs used to seal LUKS keyfile. May be specified more than once
               Default: 0-7
    -z         Use the TPM SRK well-known password

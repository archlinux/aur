A very basic initcpio hook that helps verify efi files during boot.

This is only useful on a EFI-system with both your boot and root
partition encrypted (with different passwords).

A failed verification will display a message to not enter your
password.

I created this hook as an extra measure to verify the boot chain
of a new EFI-system I got my hands on. Feel free to contribute any
changes or improvements.

Most of all configuration validation is needed, as I suspect a bad
configuration can break the script and thus throw a kernel panic.

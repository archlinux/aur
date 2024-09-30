# CUPS with GSSAPI/Kerberos enabled

This package is built automatically based on the main [cups](https://archlinux.org/packages/extra/x86_64/cups/) package.
This is done using the `_create_package.sh` script.
This script pulls the cups package and applies a sed patch to the PKGBUILD (`_patch.sed`).
It regenrates the SRCINFO and validates that the package builds using a fresh docker image (`_docker_validate.sh`).

In most cases it is sufficient to run `_create_package.sh` to update the package.
However, in some cases it might be necessary to adjust the sed patch.
I hope that the scripts need no further adjustments, but you never know.
Something that could break is the static gpg key that is imported in `_docker_validate.sh`. But that would be an easy fix.

If you ever look at the source of this package and have improvements, just contact me using the contact info from the (patched) PKGBUILDs

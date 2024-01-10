This package WILL NOT build automatically, and will not work with any AUR helper.

This is just a wrapper around Stata's install to allow the package and dependencies to be managed by Pacman.

# How to use this package

You will need two things
- A copy of the relevant version of Stata. This can be checked in the PKGBUILD source - at time of writing it is Stata 18. The archive should match the name and md5 given in the PKGBUILD. If the md5 doesn't match but you are sure the archive is correct, update the md5 hash in the PKGBUILD before running.
- You need to manually edit and update the five variables in `stata_lic.sh` with information appropriate to your license.

The built package will include your license. This package cannot be distributed, and distributing it would be against Stata's License. The license is viewable by extracting the source.

# Notes

The package installs to `/usr/local/stata`, and creates symlinks in `/usr/local/bin` for all the relevant binaries:
- stata
- xstata
- stata-se
- xstata-se
- stata-mp
- xstata-mp

Use the appropriate version for you.

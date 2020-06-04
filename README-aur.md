# the version

The version in both .SRCINFO and the PKGBUILD must be set to VERSION this is
because the CI (Github actions) uses sed to replace VERSION with the current
version of sl-sh in the Cargo.toml

# updating PKGBUILD
be sure to call
```
(out> .SRCINFO (makepkg --printsrcinfo))
```

and commit both

as always make sure to check the arch docs:
https://wiki.archlinux.org/index.php/PKGBUILD#pkgver

use of `namcap` is encouraged

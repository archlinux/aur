# oxiroute-bin

AUR recipe that installs the Arch package of an OxiRoute release, `oxiroute-<version>-1-x86_64.pkg.tar.zst`, instead of
building it. The release workflow assembles that package with `makepkg` from the profile-guided release binary and installs
it in a fresh Arch Linux container before it publishes it; this recipe downloads the file, verifies its checksum, checks that
its package name, version, `depends`, `optdepends`, `backup` and install script are the ones declared here, and extracts it
into the package, so what pacman installs is what the release tested. It provides and conflicts with `oxiroute`.

The files, service, configuration and documentation are described in the
[Arch packaging guide](../README.md), which the package also installs as
`/usr/share/doc/oxiroute/arch-packaging.md`.

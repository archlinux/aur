# fluent-bit PKGBUILD

## building

To build:

    makepkg -CcfLsr

That is `-c` for 'clean after succesful build', `-C` for 'remove $srcdir before
building', `-f` for 'force rebuilding if package already exists', `-L` for
'save a build log', `-s` for 'install missing dependencies using pacman', `-r`
for 'remove any installed dependencies after build'.

To create the .SRCINFO:

    makepkg --printsrcinfo > .SRCINFO

Update SHA512 sums using `updpkgsums` from `pacman-contrib`:

    updpkgsums

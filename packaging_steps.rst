When new version is available do the following:

#. Update the PKGBUILD file
#. run ``updpkgsums``
#. run ``mksrcinfo``
#. run ``makepkg -ci --check``
#. Test the package by installing locally.
#. If everything works, then commit and push


Beta instructions
#. Update the PKGBUILD-beta file
#. run ``updpkgsums PKGBUILD-beta``
#. run ``makepkg --printsrcinfo -p PKGBUILD-beta >| .SRCINFO``
#. run ``makepkg -p PKGBUILD-beta``
#. Test the package by installing locally.
#. If everything works, then commit and push

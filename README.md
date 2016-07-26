arch-nvidia-docker
============

  ArchLinux PKGBUILD for nvidia-docker tools https://github.com/NVIDIA/nvidia-docker

  The package source build is submitted to AUR at: https://aur.archlinux.org/packages/nvidia-docker/

Building and submitting the package
----------------------

* Update PKGBUILD and set `pkgver` to match new version from https://github.com/NVIDIA/nvidia-docker/releases
* Update the checksums using `updpkgsums`
* Make the package using `makepkg --force --nodeps --cleanbuild`
* Check the submitting guidelines at https://wiki.archlinux.org/index.php/Arch%20User%20Repository#Submitting%20packages 
* `makepkg --printsrcinfo > .SRCINFO`
* `git add .SRCINFO`
* `git commit -m "useful commit message"`
* `git push origin`

To automate most of the steps, you could also use the `buildandcopy.sh` script provided.

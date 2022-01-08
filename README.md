## Update steps
1. Update `pkgver=` line in PKGBUILD with new version 
2. Download latest DEB release from https://github.com/Ultraworking/headquarters/releases e.g. `curl --location --remote-name https://github.com/Ultraworking/headquarters/releases/download/v0.19.2/headquarters_0.19.2_amd64.deb`
3. Update PKGBUILD with SHA512 e.g. `sha512sum headquarters_0.19.2_amd64.deb | awk '{ print $1 }' | tr --delete '\n' | xsel --clipboard`   
4. `makepkg --install --syncdeps --force` # --clean deletes src/ and pkg/ after build
5. Generate .SRCINFO (mandatory) with `makepkg --printsrcinfo > .SRCINFO`
6. `git add --all; git commit -m "Update to version <version>"; git push`
7. `git push aur main:master`


## Rationale of DEB instead of RPM
There are two versions of this for Linux: RPM and DEB. I chose the DEB for this AUR, I couldn't find a "one is better than the other" explanation so there is no reason for me choosing otherwise, other than the AUR I am using as a reference, screen-desktop-bin, is using DEB.


## Resources
https://wiki.archlinux.org/index.php/Creating_packages
https://wiki.archlinux.org/index.php/.SRCINFO

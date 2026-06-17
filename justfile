update:
    updpkgsums

test:
    makepkg -Ccsif --noconfirm
    vp --version

package:
    makepkg --printsrcinfo > .SRCINFO
    jj desc -m "Update to $(grep "^pkgver" PKGBUILD | cut -d "=" -f 2)"
    jj b s -r=@ master

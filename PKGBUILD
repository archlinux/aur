# Maintainer: Nynke Lindeman <nynkelindeman@gmail.com>

pkgname=ttf-belgrad
pkgver=0.1
pkgrel=1
pkgdesc="A font based on futura, with some added Art Nouveau elements."
license=("OFL")
arch=("any")
source=("https://dl.dafont.com/dl/?f=belgrad"
       "https://openfontlicense.org/documents/OFL.txt")
sha512sums=("SKIP"
            "SKIP")

package() {
    install -d ${pkgdir}/usr/share/fonts/TTF
    install -m644 Belgrad.ttf $pkgdir/usr/share/fonts/TTF/
    install -D -m644 OFL.txt $pkgdir/usr/share/licenses/${pkgname}/OFL
}

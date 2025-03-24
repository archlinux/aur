# Maintainer: Aaron Fischer <mail@aaron-fischer.net>

pkgname=pablodraw
pkgver=3.3.14
# There is a misalignment with the current version numbering
# See: https://github.com/cwensley/pablodraw/issues/124
_broken_pkgver=3.1.14
pkgrel=1
pkgdesc="An ANSI/ASCII art editor and viewer with multi-user capabilities"
arch=("i686" "x86_64")
url="https://github.com/cwensley/pablodraw"
license=("custom")
depends=("mono" "gtk-sharp-2")
source=("https://github.com/cwensley/pablodraw/releases/download/${_broken_pkgver}-beta/pablodraw-linux-x64.tar.gz")
sha512sums=("40894fa5cd17c7e771f20051f2ca425d067f346d1867ff9a151b1b1433f878976ea2632b9819d3e2a229ea25aab5451af89cdd923f0baf47dba96ad7733eab44")

package() {
    install -m 755 -d "${pkgdir}/usr/bin"
    install -m 755 "${srcdir}/PabloDraw" "${pkgdir}/usr/bin/pablodraw"
}

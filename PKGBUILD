# Maintainer: Yann Büchau <nobodyinperson@posteo.de>
pkgname=python-matplotlib-pickled-figure-opener
pkgver=1.2.0
pkgrel=1
epoch=
pkgdesc="Open pickled matplotlib figures from file managers"
arch=('any')
url=
license=('GPL')
groups=('nobodyinperson')
depends=(python-matplotlib)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}" "${pkgname}.desktop" "${pkgname}.xml")
noextract=()
validpgpkeys=()

package() {
    install -m755 -D "${pkgname}" -t "$pkgdir"/usr/bin
    install -m644 -D "${pkgname}.desktop" -t "$pkgdir"/usr/share/applications
    install -m644 -D "${pkgname}.xml" -t "$pkgdir"/usr/share/mime/packages
}
md5sums=('0abbb65803f34ba522bde97652173234'
         '663c6999a1cce1dd2fb23f4e1defabd4'
         '8dd5e9f5aa162fe94580a74191f38c55')

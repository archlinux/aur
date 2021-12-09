# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=pass-attr
pkgver=0.1.0
pkgrel=1
pkgdesc="pass password manager extension to print single lines from password files"
arch=("any")
url="https://github.com/electrickite/${pkgname}"
license=("GPL3")
depends=("coreutils" "sed" "grep")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("6615f19deec974653c21bffa3490db3235ac2ce8d43fad0479826976876927e1")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

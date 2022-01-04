# Maintainer: Corey Hinshaw <corey(at)electrickite(dot)org>

pkgname=pass-attr
pkgver=0.2.0
pkgrel=1
pkgdesc="pass password manager extension to print single lines from password files"
arch=("any")
url="https://github.com/electrickite/${pkgname}"
license=("GPL3")
depends=("coreutils" "sed" "grep")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/electrickite/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("8a0a59de49b050c798ac0f2c8090584cf0420d2cc3687ed981a62c82cb6330f2")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

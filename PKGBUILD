# Maintainer: Felix Bühler <account at buehler dot de>
# Maintainer: lvxnull <lvxnull at proton dot me>

pkgname=nautilus-open-any-terminal
pkgver=0.6.0
pkgrel=1
pkgdesc="context-menu entry for opening other terminal in nautilus"
arch=(any)
url="https://github.com/Stunkymonkey/nautilus-open-any-terminal"
license=(GPL3)
depends=(python-nautilus)
makedepends=(make)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('96a1cf9ebd24b3a0b33c70c37f6ab39b11e6d11dc374c9199e54a0b1f19e163a')

build() {
  cd "${pkgname}-${pkgver}"

  make build
}

package() {
  cd "${pkgname}-${pkgver}"

  make PREFIX="${pkgdir}/usr" install
}

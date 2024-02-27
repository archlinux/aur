# Maintainer: Felix Bühler <account at buehler dot de>
# Maintainer: lvxnull <lvxnull at proton dot me>

pkgname=nautilus-open-any-terminal
pkgver=0.5.1
pkgrel=1
pkgdesc="context-menu entry for opening other terminal in nautilus"
arch=(any)
url="https://github.com/Stunkymonkey/nautilus-open-any-terminal"
license=(GPL3)
depends=(python-nautilus)
makedepends=(make)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1f66f7588c22486100e72e1efff96d7b2977ae05a05b14674417a143666c6a62')

build() {
  cd "${pkgname}-${pkgver}"

  make build
}

package() {
  cd "${pkgname}-${pkgver}"

  make PREFIX="${pkgdir}/usr" install
}

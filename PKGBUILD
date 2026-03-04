# Maintainer: Damglador <damglador@gmail.com>

pkgname=passkeyd-qt
pkgver=0.6.0
pkgrel=1
pkgdesc="A Qt UI for passkeyd"
arch=("any")
url="https://github.com/Damglador/passkeyd-qt"
license=("GPL-3.0")
depends=("passkeyd" "python-pydantic" "python-pam" "pyside6")
makedepends=("git")
source=("git+$url.git#tag=${pkgver}")
sha256sums=('6ca15bd698a9e5dcb315159e5857e883dc7dc4e08c159f4bdf97159f0d65db9b')
options=("!lto")

package() {
  cd "$pkgname"
  make INSTALL_PREFIX="$pkgdir" install
}

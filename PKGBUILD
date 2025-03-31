# Maintainer: Nai Erchou <naierchou@mail.ru>
pkgname=biblos-git
pkgver=0.0.0
pkgrel=0
epoch=
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="Epub ebook filesystem based catalog viewer inside Documents or in config specified dir"
arch=('any')
url="https://gitverse.ru/naierchou/biblos"
license=('GPL-3.0')
depends=('unzip' 'webappview-git')
makedepends=()
source=("git+https://gitverse.ru/naierchou/biblos.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git rev-parse --short HEAD
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make install BASEDIR="$pkgdir"
}

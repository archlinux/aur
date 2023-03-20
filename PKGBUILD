# Maintainer: Christian Heusel <christian@heusel.eu>
pkgname=mdt
pkgver=1.1.0
pkgrel=1
pkgdesc='Commandline markdown todo list manager'
arch=('any')
url="https://github.com/basilioss/$pkgname"
license=('GPL3')
depends=('gum')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f56f3f69f50b2380182be6755651d019737de7394160c1a7200b6e1985cfec2d')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

# Maintainer: Christian Heusel <christian@heusel.eu>
pkgname=mdt
pkgver=1.2.0
pkgrel=1
pkgdesc='Commandline markdown todo list manager'
arch=('any')
url="https://github.com/basilioss/$pkgname"
license=('GPL3')
depends=('gum')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fe8d1cb2b5818895cf1b514dd8f76bb28fcb9aab6178acbf4615a07f690c7f15')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

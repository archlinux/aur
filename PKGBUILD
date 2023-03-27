# Maintainer: Christian Heusel <christian@heusel.eu>
pkgname=mdt
pkgver=1.1.1
pkgrel=1
pkgdesc='Commandline markdown todo list manager'
arch=('any')
url="https://github.com/basilioss/$pkgname"
license=('GPL3')
depends=('gum')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('12bc8ec4c70487349a216b07182b88b9cb62d15816abae3a9f2b03207d5e019d')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

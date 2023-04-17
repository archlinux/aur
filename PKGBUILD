# Maintainer: Christian Heusel <christian@heusel.eu>
pkgname=mdt
pkgver=1.2.1
pkgrel=1
pkgdesc='Commandline markdown todo list manager'
arch=('any')
url="https://github.com/basilioss/$pkgname"
license=('GPL3')
depends=('gum')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('aac30cef27791d3fa2adc429ac5a3a805cd6e232bee7b2eb50e5592f90efa153')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

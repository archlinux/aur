# Maintainer: Christian Heusel <christian@heusel.eu>
pkgname=mdt
pkgver=1.4.0
pkgrel=1
pkgdesc='Commandline markdown todo list manager'
arch=('any')
url="https://github.com/basilioss/mdt"
license=('GPL3')
depends=('gum' 'findutils' 'gawk' 'grep' 'sed')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('542998a034c93ca52e72708c1d3779e597f778faf2ee70d8cf11873185332d31')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

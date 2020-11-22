# Maintainer: Lionel Miller <delonorm at gmail dot com>

pkgname=pm-graph
pkgver=5.8
pkgrel=1
pkgdesc="A tool for system developers to visualize the activity between suspend and resume"
arch=('any')
url="https://01.org/pm-graph"
license=('GPL2')
depends=('python')
source=("$pkgname-$pkgver.zip::https://github.com/intel/$pkgname/archive/$pkgver.zip")
sha256sums=('3cb0b7c2aa67417938e066b56c41a247505109bade64826801ad9bb42cc89b06')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}

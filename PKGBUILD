# Maintainer: Lionel Miller <delonorm at gmail dot com>

pkgname=pm-graph
pkgver=5.5
pkgrel=1
pkgdesc="A tool for system developers to visualize the activity between suspend and resume"
arch=('any')
url="https://01.org/pm-graph"
license=('GPL2')
depends=('python')
source=("$pkgname-$pkgver.zip::https://github.com/intel/$pkgname/archive/$pkgver.zip")
sha256sums=('7bc209c5f843e7c7c1194489adda4cce7352849eb18f31786447fc3eca177c66')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}

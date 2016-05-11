# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=overdue
pkgver=1.0.0
pkgrel=1
pkgdesc="Get notified about running daemons that reference outdated shared libraries"
arch=('any')
url="https://github.com/tylerjl/$pkgname"
license=('MIT')
depends=('gawk' 'lsof')
source=("https://github.com/tylerjl/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('473beb8202d1e70946d286beae5a394d4c10cc89a08d1fce6928e01764652320')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=$pkgdir install
}

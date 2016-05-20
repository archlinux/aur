# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=overdue
pkgver=1.1.0
pkgrel=1
pkgdesc="Get notified about running daemons that reference outdated shared libraries"
arch=('any')
url="https://github.com/tylerjl/$pkgname"
license=('MIT')
depends=('gawk' 'lsof')
source=("https://github.com/tylerjl/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('4576cb2b3c7ebb9203c0606465c9fbaa67aec726306575619fa5fc75d548dff5')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=$pkgdir install
}

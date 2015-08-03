# Maintainer: Denis Galtsev <galtsevdv@gmail.com>

pkgname=clipf
pkgver=0.4
pkgrel=2
pkgdesc="clipf is a personal finance manager with command line interface"
arch=('any')
url="http://code.google.com/p/clipf/"
license=('GPL')
depends=('python')
source=("http://clipf.googlecode.com/files/$pkgname-$pkgver.tgz")
md5sums=('ebdca9d2b4ab40c46958831f79625317')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s/python/python2/g" clipf

  make ROOTDIR="$pkgdir" install
}

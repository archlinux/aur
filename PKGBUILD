# Maintainer: realitygaps <realitygaps AT yahoo DOT com>
pkgname=pyechonest
pkgver=8.0.1
pkgrel=1
pkgdesc="Tap into the Echo Nest's Musical Brain for the best music search, information, recommendations and remix tools on the web."
arch=(any)
url="http://code.google.com/p/pyechonest"
license=(BSD)
depends=('python')
options=(!emptydirs)
source=(https://github.com/echonest/${pkgname}/archive/${pkgver}.tar.gz)
md5sums=('3cd9744feffd0fdadbefac5b5c7582b1')
install=

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir/ --optimize=1 || return 1

  # Remember to install licenses if the license is not a common license!
  # install -D -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}


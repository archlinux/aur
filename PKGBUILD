# Maintainer: grimsock <lord.grimsock at gmail dot com>

pkgname=memcache-top
pkgver=0.6
pkgrel=1
pkgdesc="perl command-line memcached stat reporter, top-like output"
arch=('any')
url="http://code.google.com/p/memcache-top/"
license=('BSD New License')
depends=('perl')
source=(http://memcache-top.googlecode.com/files/$pkgname-v$pkgver)
md5sums=('5eb035237cb482772f898597eda26106')

package() {
  install -D -m755 "$srcdir/$pkgname-v$pkgver" "$pkgdir/usr/bin/$pkgname"
}

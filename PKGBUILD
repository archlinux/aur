# Maintainer: Jonathan Liu <net147@gmail>
pkgname=python2-appy
pkgver=0.8.5
pkgrel=1
pkgdesc="a bunch of tools for developing python applications"
arch=(any)
url="http://appyframework.org/"
license=('GPL')
depends=('python2')
source=("http://launchpad.net/appy/0.8/$pkgver/+download/appy-$pkgver.zip")
md5sums=('92aa226442e8b42fc04897e91f035634')

package() {
  cd "$srcdir"
  install -d -m 755 "$pkgdir/usr/lib/python2.7/site-packages/"
  cp -r appy "$pkgdir/usr/lib/python2.7/site-packages/"
}

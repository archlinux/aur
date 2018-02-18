# Python package author: Bob Green <rgreen@goscoutgo.com>
# Maintainer: Dennis Stengele <dennis@stengele.me>
pkgname=python2-backoff
pkgver=1.4.3
pkgrel=1
pkgdesc="Function decoration for backoff and retry"
arch=(any)
url="https://github.com/litl/backoff"
license=(MIT)
makedepends=("python2" "python2-pip")
build() {
  pip2 install --no-deps --target="backoff" backoff
}
package() {
  mkdir -p $pkgdir/usr/lib/python2.7/site-packages/
  cp -r $srcdir/backoff/* $pkgdir/usr/lib/python2.7/site-packages/
}

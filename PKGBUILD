# $Id: PKGBUILD 26387 2010-09-15 10:52:53Z cbrannon $
# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Maintainer: Aaron Schaefer <aaron@elasticdog.com>
# Contributor: Evan Gates <evan.gates at gmail dot com>
# Contributor: Vardyr <vardyr.al at insocada dot com>

pkgname=woof
pkgver=20120531
_pkgver='2012-05-31'
pkgrel=1
pkgdesc='An ad-hoc single file webserver; Web Offer One File'
arch=('any')
url='http://www.home.unix-ag.org/simon/woof.html'
license=('GPL2')
depends=('python2')
conflicts=('woof-python3')
source=("http://www.home.unix-ag.org/simon/$pkgname-$_pkgver.py")
md5sums=('89081e64362421dcb683a19c10a15e59')

build() {
  /bin/true
}

package() {
  cd "$srcdir"

  install -D -m755 "$pkgname-$_pkgver.py" "$pkgdir/usr/bin/$pkgname"
  sed -i -e 's,^#!/usr/bin/env python$,#!/usr/bin/env python2,' \
    "$pkgdir/usr/bin/$pkgname"
}

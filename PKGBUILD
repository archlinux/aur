# $Id: PKGBUILD 188058 2016-08-30 15:26:04Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Morgan LEFIEUX <comete_AT_archlinuxfr.org>

pkgname=python2-lzo
pkgver=1.11
pkgrel=2
pkgdesc="Python bindings for the LZO data compression library"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/python-lzo"
license=('GPL2')
depends=('python2')
source=("https://pypi.python.org/packages/bc/ac/cec925b9367b8f7f18a606d462fe17069fb13b0fd2fe7df0c324a83a8018/python-lzo-$pkgver.tar.gz")
md5sums=('b5cd60498474dab58c1ea2385adfa7bd')

build() {
  cd $srcdir/python-lzo-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/python-lzo-$pkgver
  python2 setup.py install --root $pkgdir
}

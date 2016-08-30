# $Id: PKGBUILD 188058 2016-08-30 15:26:04Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Morgan LEFIEUX <comete_AT_archlinuxfr.org>

pkgname=python2-lzo
pkgver=1.08
pkgrel=1
pkgdesc="UBI reader"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/python-lzo"
license=('GPL2')
depends=('python2')
source=("https://pypi.python.org/packages/26/d2/6d118e3b8d29b61d75dc9279ae8233915aaefaa630f6a6ad3b9924147367/python-lzo-$pkgver.tar.gz")
md5sums=('5fa6fb70428dcf3318d104ae192ad5c9')

build() {
  cd $srcdir/python-lzo-$pkgver
  python2 setup.py build
}

package() {
  cd $srcdir/python-lzo-$pkgver
  python2 setup.py install --root $pkgdir
}

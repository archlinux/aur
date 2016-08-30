# $Id: PKGBUILD 188058 2016-08-30 15:26:04Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Morgan LEFIEUX <comete_AT_archlinuxfr.org>

pkgname=ubi_reader
pkgver=1
pkgrel=1
pkgdesc="UBI reader"
arch=('i686' 'x86_64')
url="https://github.com/jrspruitt/ubi_reader"
license=('GPL3')
depends=('python2')
makedepends=('git')
source=("git://github.com/jrspruitt/ubi_reader.git")
md5sums=('SKIP')

build() {
  cd $srcdir/ubi_reader
  python2 setup.py build
}

package() {
  cd $srcdir/ubi_reader
  python2 setup.py install --root $pkgdir
}

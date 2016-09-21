# Maintainer: Tran Duc Nam <dynamo.foss@gmail.com>

pkgname=python2-libkeepass
pkgdesc="library for keepassx"
url="http://github.com/phpwutz/libkeepass"
depends=(
    'python2-crypto'
    'python2-nose'
    'python2-lxml'
    )
makedepends=('python2-setuptools')
license=('GPLv2')
arch=('any')
pkgver=0.1.0
pkgrel=1
source=('git+git://github.com/phpwutz/libkeepass.git')
md5sums=('SKIP')

package() {
  cd "$srcdir/libkeepass"
  python2 setup.py install --root="$pkgdir" --optimize=1
  chmod +r ${pkgdir}/* -R
}

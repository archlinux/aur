# Maintainer: Benjamin Wang <w.benji@tuta.io>
# Contributor: Arnold Sommerfeld <mrsommerfeld@pm.me>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Pappa <jcberg@gmail.com >

pkgname=python2-xlib
pkgver=0.31
pkgrel=1
pkgdesc="A fully functional X client library for Python 2 programs"
url="https://github.com/python-xlib/python-xlib"
arch=('any')
license=('LGPL')
depends=('python2-six')
makedepends=('python2-setuptools-scm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-xlib/python-xlib/archive/$pkgver.tar.gz")
sha256sums=('5484b3a30904bd8efb8bc7af455f93b87c99b779605a07c7c81f607e5254113d')

build(){
  cd "python-xlib-$pkgver"
  python2 setup.py build
}

package_python2-xlib() {
  cd "python-xlib-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# $Id$
# Maintainer: zhangshuoliang <zhangshuoliang007@gmail.com>
 
pkgbase=python-pysimplegui
pkgname=('python-pysimplegui')
pkgver=3.5.1
pkgrel=1
pkgdesc='Super-simple to create custom layout GUI'
arch=('any')
license=('LGPLv3+')
 depends=('python' 'tk')
url='https://github.com/MikeTheWatchGuy/PySimpleGUI'
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=(${pkgbase}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/P/PySimpleGUI/PySimpleGUI-${pkgver}.tar.gz)
sha256sums=('02de2be137abf28ceb3cf1b0227655638902a305a022e9f7d7f5d04f911e5149')
 
 
build() {
  cd "$srcdir"/PySimpleGUI-$pkgver
  python setup.py build
 
}
 
 
package_python-pysimplegui() {
  depends=('python' 'tk')
  cd PySimpleGUI-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
 
 
# vim:set ts=2 sw=2 et:

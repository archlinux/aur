# $Id: PKGBUILD 193080 2016-10-23 16:01:17Z felixonmars $
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=thot
pkgname=('thot')
pkgver=0.1.0
pkgrel=1
pkgdesc="Thot is a line scanner application, primarily targetting Ciclop scanner"
arch=('any')
license=('GPL')
url="https://github.com/fdev31/thot"
depends=('python-setuptools' 'python-pyserial' 'opencv' 'python-scipy' 'python-numpy' 'python-prompt_toolkit')
source=("https://github.com/fdev31/thot/archive/$pkgver.zip")
sha512sums=('SKIP')

build() {
  cd "$srcdir"/$pkgbase-$pkgver
  python setup.py build
}

package() {
  cd "$srcdir"/$pkgbase-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}


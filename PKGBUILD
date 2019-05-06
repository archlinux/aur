# $Id$
# Maintainer: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Pierre Chapuis <catwell@archlinux.us>
# Contributor: Stefano Esposito <ragnarok@email.it>

_name=pdfminer.six
pkgname="python-$_name"
pkgver=20181108
pkgrel=3
pkgdesc="PDF parser and analyzer for Python"
depends=('python-six' 'python-chardet' 'python-pycryptodome' 'python-sortedcontainers')
makedepends=('git' 'python-setuptools')
arch=('any')
url="https://github.com/pdfminer/pdfminer.six"
license=('MIT')
source=("git+https://github.com/pdfminer/${_name}.git#tag=${pkgver}")
sha384sums=('SKIP')

package() {
  cd "$srcdir/$_name"
  python setup.py install --root="$pkgdir" --optimize=1
}

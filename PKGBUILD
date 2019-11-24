# $Id$
# Maintainer: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Pierre Chapuis <catwell@archlinux.us>
# Contributor: Stefano Esposito <ragnarok@email.it>

_name=pdfminer.six
pkgname="python-$_name"
pkgver=20191110
pkgrel=1
pkgdesc="PDF parser and analyzer for Python"
depends=('python-six' 'python-chardet' 'python-pycryptodome' 'python-sortedcontainers')
makedepends=('python-setuptools')
arch=('any')
url="https://github.com/pdfminer/pdfminer.six"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha384sums=('1f98a6553b1a6dfcb51f45ff730b4c1a77da9b2e815c609e428d361354846b668a4bb50e46db1b034e141861be6a03d3')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

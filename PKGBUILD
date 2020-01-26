# $Id$
# Maintainer: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Pierre Chapuis <catwell@archlinux.us>
# Contributor: Stefano Esposito <ragnarok@email.it>

_name=pdfminer.six
pkgname="python-$_name"
pkgver=20200124
pkgrel=1
pkgdesc="PDF parser and analyzer for Python"
depends=('python-six' 'python-chardet' 'python-pycryptodome' 'python-sortedcontainers')
makedepends=('python-setuptools')
arch=('any')
url="https://github.com/pdfminer/pdfminer.six"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha384sums=('f2853ad3bcdbc1575a535d135f01fd65f2cbfa22d5026cc779e4cb635f5f78ceccf32a832f22299ed0e5519a72d3986d')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

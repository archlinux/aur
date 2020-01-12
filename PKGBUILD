# $Id$
# Maintainer: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Pierre Chapuis <catwell@archlinux.us>
# Contributor: Stefano Esposito <ragnarok@email.it>

_name=pdfminer.six
pkgname="python-$_name"
pkgver=20200104
pkgrel=1
pkgdesc="PDF parser and analyzer for Python"
depends=('python-six' 'python-chardet' 'python-pycryptodome' 'python-sortedcontainers')
makedepends=('python-setuptools')
arch=('any')
url="https://github.com/pdfminer/pdfminer.six"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha384sums=('c1f273993d3bfca8c51fbe052c43959cd5212db68815f18bb1171d358df4c8de8cbc3df447c4cf62c650e7c90035de95')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

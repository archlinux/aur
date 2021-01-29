# maintainer Storm Dragon <stormdragon2976@gmail.com>

pkgname='python-spake2'
pkgver=0.8
pkgrel=6
pkgdesc="This library implements the SPAKE2 password-authenticated key exchange"
arch=('any')
url="https://pypi.python.org/packages/10/7d/spake2-${pkgver}"
license=('MIT')
depends=('python' 'python-hkdf')                                                                                                                                
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/s/spake2/spake2-${pkgver}.tar.gz")
md5sums=('0155bad518bb49c39994fe0b7d9fb32c')

build() {
  cd "$srcdir"/spake2-${pkgver}
  python setup.py build
}
 
package() {
  cd "$srcdir/spake2-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

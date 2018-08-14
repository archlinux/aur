# Maintainer: Storm Dragon <stormdragon2976@gmail.com> 

pkgname=python-hkdf
pkgver=0.0.3
pkgrel=2
pkgdesc="This module implements the HMAC Key Derivation function, defined at http://tools.ietf.org/html/draft-krawczyk-hkdf-01"
arch=('any')
url="https://pypi.python.org/packages/c3/be/hkdf-${pkgver}"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/c3/be/327e072850db181ce56afd51e26ec7aa5659b18466c709fa5ea2548c935f/hkdf-${pkgver}.tar.gz")
md5sums=('d10471ad0ec891cdbe165d78282c943e')

build() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname#python-}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

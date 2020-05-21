# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-flask_helpers
pkgver=0.1
pkgrel=1
pkgdesc='Useful stuff for Flask application'
arch=('any')
url="https://pypi.org/project/flask_helpers"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/3f/32/5979ac16b0e910ddefb2b95df37bf994f6a74e579bf67b2ccbb938f9c658/flask_helpers-${pkgver}.tar.gz")
sha256sums=('706dbd0d665c8a3f7c403a61e5350cff22779c760e257a087075b9cc7f3474cc')

package() {
  cd "${srcdir}/flask_helpers-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
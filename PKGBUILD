# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgbase='pyocclient'
pkgname='python-pyocclient'
pkgver='0.6'
pkgrel='2'
pkgdesc='Python client library for ownCloud'
arch=('any')
url="https://github.com/owncloud/${pkgbase}"
depends=('python' 'python-requests' 'python-six')
makedepends=('python' 'python-setuptools')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ec524bbabecd2ba00315f6517dc0628bb2c8c32d644a3c5dfc2f1e7d61eb65b4')

package() {
  cd "${pkgbase}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
}

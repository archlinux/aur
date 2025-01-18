# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-tmdbapis'
_name=${pkgname#python-}
pkgver=1.2.28
pkgrel=1
pkgdesc="A set of tools based around the requests library for safely making HTTP requests on behalf of a third party."
arch=('any')
url="https://github.com/meisnate12/TMDbAPIs"
license=('MIT')
depends=(
  'python'
  'python-requests'
)
makedepends=(
  'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('91a7c2ed64ac74ec5f5e28ace94cd7a37fefdb6ae83e1396c996af3fac7ea2c7e11bd35213b748bac5f509a0c59165f4c6f5560d6b12a0b06f05a0b7c33cd61d')

package() {
  cd tmdbapis-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}

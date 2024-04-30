# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-tmdbapis'
_name=${pkgname#python-}
pkgver=1.2.16
pkgrel=2
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
sha512sums=('3214ff83f16ed14433bd9b9aef9076117b40d6691436fb3d172a520995b9cb1456000bfd8aeb4746afa0f9ec0a6ec0d2dcefacf570d69c0d9dd85e4497558179')

package() {
  cd tmdbapis-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}

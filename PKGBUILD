pkgname='python-inscriptis'
_name=${pkgname#python-}
pkgver=2.3.1
pkgrel=1
pkgdesc="HTML to text conversion library"
arch=('any')
url="https://github.com/weblyzard/inscriptis"
license=('Apache')
depends=(
  'python-lxml'
  'python-requests'
)

makedepends=(
  'python-setuptools'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('6f2e62094343dd84b2f9f65858ff982b52f74fb6f277e28658c9b61920c62ad3')

package() {
  cd ${_name}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

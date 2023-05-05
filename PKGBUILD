pkgname='python-inscriptis'
_name=${pkgname#python-}
pkgver=2.3.2
pkgrel=2
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
sha256sums=('4a272b7e8edf45eab453839df2acdcaaa0d388be413638e16222367b4e75274a')

package() {
  cd ${_name}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

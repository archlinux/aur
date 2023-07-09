# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-unrar'
_name=${pkgname#python-}
pkgver=0.4
pkgrel=3
pkgdesc='Work with RAR archive files through unrar library using ctypes.'
arch=('any')
url='https://github.com/matiasb/python-unrar'
license=('GPLv3')
depends=(
  'python'
  'python-unrardll'
  'unrar'
)
makedepends=(
  'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b24447a5b93024be600ef8255668ba23a30f451176577b691559ea1359f7d164')

package() {
  cd unrar-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:

# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-unrar-cffi'
_name=${pkgname#python-}
pkgver=0.2.1
pkgrel=2
pkgdesc='Exposes unrar library functionality through a zipfile-like interface.'
arch=('any')
url='https://github.com/davide-romanini/unrar-cffi'
license=('Apache')
depends=(
  'python-twine'
)
makedepends=(
  'python-setuptools'
  'python-pytest'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ef8bc5c4f71fc32f660c4d56e82a7fc7dabb5a99c4db845e454c9ae8718413c3')

package() {
  cd unrar-cffi-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:

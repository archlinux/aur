# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-unrar-cffi'
_name=${pkgname#python-}
pkgver=0.1.0
_subver='a5'
pkgrel=1
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
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}${_subver}.tar.gz")
sha256sums=('d12d89ad1e1e1ee73ea7f26351fbaab5e65f23375612a2521453e8dd32511df7')

package() {
  cd unrar-cffi-${pkgver}${_subver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:

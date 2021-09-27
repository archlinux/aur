# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname='python-unrar-cffi'
_name=${pkgname#python-}
pkgver=0.2.2
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
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('9de6d907c0728724be07acfcb479eadf2692f1039ca7cf2df268abb5dfaf4b5d')

package() {
  cd unrar-cffi-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:

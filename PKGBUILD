# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname='python-sabyenc3'
_name=${pkgname#python-}
pkgver=4.0.1
pkgrel=1
pkgdesc="Push Notifications that work with just about every platform"
arch=('any')
url="https://github.com/sabnzbd/sabyenc"
license=('lgplv3')

makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('74249291e6c5623b8b881cb175990c95d928c9d8d0346aa1cf85018d079869fc')

package() {
  cd sabyenc3-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:

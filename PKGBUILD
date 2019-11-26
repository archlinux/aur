# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname='python-apprise'
_name=${pkgname#python-}
pkgver=0.8.2
pkgrel=1
pkgdesc="Push Notifications that work with just about every platform"
arch=('any')
url="https://github.com/caronc/apprise"
license=('MIT')
depends=('python-decorator'
         'python-requests'
         'python-requests-oauthlib'
         'python-oauthlib'
         'python-urllib3'
         'python-six'
         'python-click'
         'python-markdown'
         'python-yaml')

makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('1c86488956931200e816f32d20af6923c273d995ff7b079c11a5ba9b716b1754')

package() {
  cd apprise-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:

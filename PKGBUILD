# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname='python-apprise'
_name=${pkgname#python-}
pkgver=0.8.4
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
sha256sums=('c1ca39d18f37f29537377e04941701e14a3069726b15835f78daa829f4b67c96')

package() {
  cd apprise-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:

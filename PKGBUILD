# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname='python-apprise'
_name=${pkgname#python-}
pkgver=0.8.3
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
sha256sums=('0c95c24237926ec199e2e8ac8a16d78420947d05668441b4fd0e49d0cf2b22c9')

package() {
  cd apprise-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:

# Maintainer: Doron Behar <doron.behar@gmail.com>
# Contributer: Guillaume Brogi <gui-gui at netcourrier dot com>

pkgname=python-pybitbucket_fork
_name=pybitbucket_fork
pkgver=0.12.2
pkgrel=1
provides=('python-pybitbucket')
conflicts=('python-pybitbucket')
pkgdesc="Tool for managing remote repositories from your git CLI"
arch=('any')
url="https://github.com/guyzmo/pybitbucket"
license=('GPL2')
depends=('python' 'python-future' 'python-six' 'python-requests' 'python-requests-oauthlib' 'python-oauthlib' 'python-uritemplate' 'python-simplejson' 'python-voluptuous')
makedepends=('python-setuptools' 'python-pip')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
md5sums=('902a9d41ae86ec1dde0f21f082991edf')

package() {
	cd "$srcdir/$_name-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}

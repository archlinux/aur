# Maintainer: Radim Sückr <contact@radimsuckr.cz>

pkgname=developers-chamber
pkgver=0.0.25
pkgrel=3
pkgdesc='Python developers utility library'
arch=('any')
url='https://github.com/druids/developers-chamber'
license=('MIT')
depends=('python' 'python-boto3' 'python-docker' 'python-click' 'python-gitpython' 'python-requests' 'python-click-completion' 'python-hosts' 'python-coloredlogs')
makedepends=('python-setuptools')
source=('git+https://github.com/druids/developers-chamber.git')
sha512sums=('SKIP')

prepare() {
	cd ${pkgname}
	python setup.py build
}

package() {
	cd ${pkgname}
	python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}

# Maintainer: Phil Schaf <flying-sheep@web.de>
_name=async_timeout
pkgname=python-async-timeout
pkgver=1.0.0
pkgrel=1
pkgdesc='asyncio-compatible timeout class'
arch=('any')
url="https://github.com/aio-libs/${_name}"
license=('Apache')
depends=()
makedepends=('python-setuptools')
source=("https://github.com/aio-libs/${_name}/archive/v${pkgver}.tar.gz")
md5sums=('1479add705fcf2a5afcd603c3658dbc7')

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
	python setup.py install --root="${pkgdir}"
}

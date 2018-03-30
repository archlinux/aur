# Maintainer: Joseph Brains <jnbrains@gmail.com>
_pkgname=aiohttp-cors
pkgname=python-${_pkgname}-gns3
pkgver=0.5.3
pkgrel=2
pkgdesc="CORS support for aiohttp (GNS3)"
arch=("any")
url="https://github.com/aio-libs/${_pkgname}"
license=('Apache')
groups=('gns3')
depends=('python' 'python-aiohttp-gns3')
makedepends=('python-setuptools')
provides=("python-${_pkgname}")
conflicts=("python-${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/aio-libs/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('bec79cc5c62cffd044899863a73a450d058a6cb2c965d4c8cec8e6b0d06e9768')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python3 setup.py install --root="${pkgdir}/" --optimize=1
}

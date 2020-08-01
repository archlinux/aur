# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=crc32c
pkgname=python-${_name}
pkgver=2.0.1
pkgrel=1
pkgdesc="Implementation of the crc32c algorithm in hardware and software"
arch=('any')
url="https://github.com/ICRAR/crc32c"
license=('LGPL2')
depends=('python')
makedepends=('python-setuptools')
source+=("https://github.com/ICRAR/crc32c/archive/v${pkgver}.tar.gz")
sha256sums=('599991270618bb49101cffaf7303ee2e8ffc2126450b8c7b2c7e85d3677725ea')

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --optimize=1 --root="${pkgdir}"
}

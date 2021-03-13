# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=crc32c
pkgname=python-${_name}
pkgver=2.2
pkgrel=1
pkgdesc="Implementation of the crc32c algorithm in hardware and software"
arch=('any')
url="https://github.com/ICRAR/crc32c"
license=('LGPL2')
depends=('python')
makedepends=('python-setuptools')
source+=("https://github.com/ICRAR/crc32c/archive/v${pkgver}.tar.gz")
sha256sums=('fe059196c1e179929c55c41391cd847880a5361a024af64c06d437efe22f6668')

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --optimize=1 --root="${pkgdir}"
}

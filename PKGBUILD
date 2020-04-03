# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-bls
pkgver=0.1.8
pkgrel=1
pkgdesc="BLS12-381 and Signatures in Python"
url="https://github.com/zebra-lucky/python-bls"
arch=('i686' 'x86_64')
license=('Apache2')
depends=('python')
makedepends=('python-setuptools' 'cython')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zebra-lucky/${pkgname}/archive/${pkgver}.tar.gz")

sha256sums=('bb61c66f4fb543698a7abd93a2991e9d4430c35698f163fc43004a198465c834')

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

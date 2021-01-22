# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-bls
pkgver=0.1.9
pkgrel=1
pkgdesc="BLS12-381 and Signatures in Python"
url="https://github.com/zebra-lucky/python-bls"
arch=('i686' 'x86_64')
license=('Apache2')
depends=('python')
makedepends=('python-setuptools' 'cython')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zebra-lucky/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c06658e4692ccf099494140ec76bf12274aeb6fc20d1e09fd6ebaeac94fb7b02')


package() {
  cd ${pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}

# Maintainer: dtluna <dtluna at openmailbox dot org>

_pkgname=gnusocial
pkgname=python-${_pkgname}
pkgver=1.2.0
pkgrel=1
pkgdesc="GNU Social API for Python 3"
arch=('any')
url='https://gitgud.io/dtluna/pygnusocial'
license=('GPL3')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
source=("https://gitgud.io/dtluna/pygnusocial/repository/archive.tar.gz?ref=v${pkgver}")
sha512sums=('44c1d1bd5e4053b20c56cd97068e04e2cfcf79d19a6626b531a627f86967970f23a91dca451b6a47e0bc63c02d08b60a7719bc33c80059127cb1ddf85164f3de')
package() {
  cd "${srcdir}/py${_pkgname}-v${pkgver}-1d960ca733a6bd5f051aa23e4f2150bfffd712c5/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# Maintainer: dtluna <dtluna at openmailbox dot org>

_pkgname=gnusocial
pkgname=python-${_pkgname}
pkgver=1.4.0
pkgrel=1
pkgdesc="GNU Social API for Python 3"
arch=('any')
url='https://gitgud.io/dtluna/pygnusocial'
license=('GPL3')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
source=("https://gitgud.io/dtluna/pygnusocial/repository/archive.tar.gz?ref=v${pkgver}")
sha512sums=('d7fee48fde34e203bac94b6d42ee39da8019852adbd2f25fe027121857ffd96ae0b9ebbe3016a28655be5b9165b025a5dad9dddbf7c92ad288a548b55d57516f')
package() {
  cd "${srcdir}/py${_pkgname}-v${pkgver}-39b3db206a23db02677476a2c40e1fa007171c0b/"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-aiosmtpd')
pkgver=1.1
pkgrel=1
pkgdesc="A reimplementation of the Python stdlib smtpd.py based on asyncio"
arch=(any)
url="https://github.com/aio-libs/aiosmtpd"
license=('APACHE')
options=(!emptydirs)
makedepends=('python-setuptools')
depends=('python-atpublic')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aio-libs/aiosmtpd/archive/${pkgver}.tar.gz")
sha256sums=('5a3925a0c7609005e5cfd96e916a644e20b201b6743ffe0e095addb2b146a198')

package() {
  cd "${srcdir}/aiosmtpd-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:

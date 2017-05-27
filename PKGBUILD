# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-aiosmtpd')
pkgver=1.0
pkgrel=1
pkgdesc="A reimplementation of the Python stdlib smtpd.py based on asyncio"
arch=(any)
url="https://github.com/aio-libs/aiosmtpd"
license=('APACHE')
options=(!emptydirs)
makedepends=('python-setuptools')
depends=('python-atpublic')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aio-libs/aiosmtpd/archive/${pkgver}.tar.gz")
sha256sums=('bcaafd67f274e7b40cca226f90aef7fd84cf0501eb629866692def4c19f87412')

package() {
  cd "${srcdir}/aiosmtpd-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:

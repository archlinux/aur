# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-aiosmtpd')
pkgver=1.0a4
pkgrel=1
pkgdesc="A reimplementation of the Python stdlib smtpd.py based on asyncio"
arch=(any)
url="https://github.com/aio-libs/aiosmtpd"
license=('APACHE')
options=(!emptydirs)
makedepends=('python-setuptools')
depends=('python-atpublic')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aio-libs/aiosmtpd/archive/${pkgver}.tar.gz")
sha256sums=('38eb868217834dfaea46c7646df61701c4d4d400ce68ef98c5a234845c5e26f6')

package() {
  cd "${srcdir}/aiosmtpd-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:

# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-otp'
pkgver=0.1.0
pkgrel=1
pkgdesc='A pass extension for managing one-time-password (OTP) tokens.'
arch=('any')
url='https://github.com/tadfisher/pass-otp'
license=('GPL3')
depends=('pass'
         'oath-toolkit')
optdepends=('qrencode: for generating QR code images')
source=(https://github.com/tadfisher/pass-otp/archive/v${pkgver}.tar.gz)
sha512sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}

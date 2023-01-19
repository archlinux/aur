# Maintainer: TheLastGimbus <mateusz.soszynski@tuta.io>
pkgname=gpth-bin
pkgver=3.3.1
pkgrel=2
pkgdesc='Tool to help you with exporting stuff from Google Photos'
arch=('x86_64')
url='https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper'
license=('Apache')
depends=()
provides=('gpth')
conflicts=('gpth')
options=('!strip')
source=("${url}/releases/download/v${pkgver}/gpth-linux")
sha256sums=('b74e03cbe5c851aa5d35421ee6efac663a9b637a71eae23486c9e62206406ddb')

package() {
    install -Dm755 "gpth-linux" "${pkgdir}/usr/bin/gpth"
}

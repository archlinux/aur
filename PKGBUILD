# Maintainer: TheLastGimbus <mateusz.soszynski@tuta.io>
pkgname=gpth-bin
pkgver=3.2.0
pkgrel=1
pkgdesc='Tool to help you with exporting stuff from Google Photos'
arch=('x86_64')
url='https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper'
license=('Apache')
depends=()
provides=('gpth')
conflicts=('gpth')
options=('!strip')
source=("${url}/releases/download/v${pkgver}/gpth-linux")
sha256sums=('')

package() {
    install -Dm755 "gpth-gpth-linux" "${pkgdir}/usr/bin/gpth"
}

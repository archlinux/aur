# Maintainer: TheLastGimbus <mateusz.soszynski@tuta.io>
pkgname=gpth-bin
pkgver=3.4.2
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
sha256sums=('7996a371d1a8dd0a2b15344c63b0b2f6d9dc38ec3baca55e3db1bac2ab8d19a2')

package() {
    install -Dm755 "gpth-linux" "${pkgdir}/usr/bin/gpth"
}

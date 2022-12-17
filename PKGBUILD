# Maintainer: TheLastGimbus <mateusz.soszynski@tuta.io>
pkgname=gpth-bin
pkgver=3.0.0
pkgrel=1
pkgdesc='Tool to help you with exporting stuff from Google Photos'
arch=('x86_64')
url='https://github.com/TheLastGimbus/GooglePhotosTakeoutHelper'
license=('Apache')
depends=()
provides=('gpth')
conflicts=('gpth')
options=('!strip')
source=("${url}/releases/download/v${pkgver}/gpth-v${pkgver}-Linux.exe")
sha256sums=('1d85ab51d045721ba44a28f34afee35c6ffcba0f00adcad959286c5aaa7c20fb')

package() {
    install -Dm755 "gpth-v${pkgver}-Linux.exe" "${pkgdir}/usr/bin/gpth"
}

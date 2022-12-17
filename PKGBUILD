# Maintainer: TheLastGimbus <mateusz.soszynski@tuta.io>
pkgname=gpth-bin
pkgver=3.1.0
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
sha256sums=('62cec1ce1b4f2f975d78b474a1c95059ecadf91fe46f591515b6f68a36d52d04')

package() {
    install -Dm755 "gpth-v${pkgver}-Linux.exe" "${pkgdir}/usr/bin/gpth"
}

# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-telicam-driver
pkgver='3.0.1.1_3'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=()
conflicts=(zivid-telicam-sdk)
provides=(zivid-telicam-sdk)

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.9.0+4dbba385-1/u18/zivid-telicam-driver_3.0.1.1-3_amd64.deb)
sha256sums=(291fd62e66728d4695226751b10cc0b458db52d9e5212463db75b1c42bd581a9)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

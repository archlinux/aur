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

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.1.0+d2007e12-1/u18/zivid-telicam-driver_3.0.1.1-3_amd64.deb)
sha256sums=(e264dde084f2b64f5cd266375f9d1142a5fc0a6d4bb9de2704f245ab21984bde)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

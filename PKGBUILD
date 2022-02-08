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

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.6.1+6cec8609-3/u18/zivid-telicam-driver_3.0.1.1-3_amd64.deb)
sha256sums=(aa301dd669548ff5cfc40b425851c48445378defb1c27e8a0722a578ddcb933a)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

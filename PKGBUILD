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

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.8.0+891708ba-1/u18/zivid-telicam-driver_3.0.1.1-3_amd64.deb)
sha256sums=(cb5907b0a1cca453d4835e2817adcda4cc540550506d889961675eff361b0685)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

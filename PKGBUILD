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

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.2.0+f0867d62-1/u18/zivid-telicam-driver_3.0.1.1-3_amd64.deb)
sha256sums=(87fa3ee39fde8f5f439f92a671765ee81865038e37a326bd670c3a837a58bfa4)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

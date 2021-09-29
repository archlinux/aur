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

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.4.2+1a2e8cfb-1/u18/zivid-telicam-driver_3.0.1.1-3_amd64.deb)
sha256sums=(1f29dc2724116de141b842b9642fa7822eaa1431000500faa939a984d0d45393)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

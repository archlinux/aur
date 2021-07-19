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

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.4.0+a330c1a6-1/u18/zivid-telicam-driver_3.0.1.1-3_amd64.deb)
sha256sums=(a7e3a50de39a9337259ffa3834099481c3f0dc653268ac38371a060176b7c7cb)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

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

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.0.0+7c4918cf-14/u18/zivid-telicam-driver_3.0.1.1-3_amd64.deb)
sha256sums=(4b92a0031cf236478d6715ee112bb88f76abcb809d2ec9c1c615e9a805a1bb4d)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

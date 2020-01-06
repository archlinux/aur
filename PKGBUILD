# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-telicam-driver
pkgver='2.0.0.1_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=()
conflicts=(zivid-telicam-sdk)
provides=(zivid-telicam-sdk)

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.8.0+89ae8b3e-39/u18/zivid-telicam-driver_2.0.0.1-1_amd64.deb)
sha256sums=(9318025670b0d14ee9db7fbf2de50b92bdf645787f9f77e99ded5b209ae43377)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

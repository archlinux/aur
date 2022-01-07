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

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.6.0+fa0036c5-1/u18/zivid-telicam-driver_3.0.1.1-3_amd64.deb)
sha256sums=(a7bc7cdd3c7bb8057d71a9bf7af8eb8306175c33cf3a8d565af60dd3837c449c)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

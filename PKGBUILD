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

source=(https://downloads.zivid.com/sdk/releases/2.11.0+95829246-1/u20/zivid-telicam-driver_3.0.1.1-3_amd64.deb)
sha256sums=(3104e26bf9bb8787cdffb8935d044e4acef7a034fb66bb75f75811bf3bfa44f4)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

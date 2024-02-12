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

source=(https://downloads.zivid.com/sdk/releases/2.11.1+de9b5dae-1/u20/zivid-telicam-driver_3.0.1.1-3_amd64.deb)
sha256sums=(81d15c2d8addcf0bb45fa84635a5e7d6bf49f47109c2ede7498df3161a5b910f)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

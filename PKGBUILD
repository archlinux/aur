# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
pkgver='2.9.0+4dbba385_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.9.0+4dbba385-1/u18/zivid-genicam_2.9.0+4dbba385-1_amd64.deb)
sha256sums=(e50163f0be41f8d0f352de197482f5c716565341793439d9c9c426fb31cd5c8b)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

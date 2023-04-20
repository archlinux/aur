# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
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

source=(https://downloads.zivid.com/sdk/releases/2.9.0+4dbba385-1/u18/zivid-tools_2.9.0+4dbba385-1_amd64.deb)
sha256sums=(905d0fdee135cf40d597a73d009338b3734e528cbc4a72bda813f5b5130d3ac4)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

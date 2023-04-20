# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.9.0+4dbba385_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.9.0+4dbba385-1/u18/zivid_2.9.0+4dbba385-1_amd64.deb)
sha256sums=(bcd579ad44673597894af928f34c7b270f706f8e906550a4f39cc0b7287f3b6f)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

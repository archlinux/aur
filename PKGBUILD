# Maintainer: John Ingve Schjølberg <john.schjolberg@zivid.com>

pkgname=zivid-tools
pkgver='2.18.0+1b44dbef_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.18.0+1b44dbef-1/u20/zivid-tools_2.18.0+1b44dbef-1_amd64.deb)
sha256sums=(5a566567a1355ba037a174eadfc674106bff37894b2ad79ebb125f001db552a3)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

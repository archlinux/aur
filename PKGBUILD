# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='1.4.0+956f554d_12'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.4.0+956f554d-12/u18/zivid-tools_1.4.0+956f554d-12_amd64.deb)
sha256sums=(192d236927f06e70d669a14eb405cffa08abb3ff50f6ea1a3d4df58138897bd9)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

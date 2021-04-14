# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
pkgver='2.3.0+a08763f1_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.3.0+a08763f1-1/u18/zivid-genicam_2.3.0+a08763f1-1_amd64.deb)
sha256sums=(5f8b821e318c2664205171bc6fb4f46f01d2c1cb4a2f1351fd461ba896bfc02c)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

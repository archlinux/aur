# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
pkgver='2.16.0+46cdaba6_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.16.0+46cdaba6-1/u20/zivid-genicam_2.16.0+46cdaba6-1_amd64.deb)
sha256sums=(b00ababa2a8784879d13a2a8d20f3f98d2b9d7a837097edf3efdf9d9fc4eef8c)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

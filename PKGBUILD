# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.1.0+d2007e12_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.1.0+d2007e12-1/u18/zivid-tools_2.1.0+d2007e12-1_amd64.deb)
sha256sums=(7e74e23237ea46b0791b0a87badabc5838886046168ea0ca8127509a03ef6c40)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

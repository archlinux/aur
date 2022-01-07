# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='2.6.0+fa0036c5_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.6.0+fa0036c5-1/u18/zivid-studio_2.6.0+fa0036c5-1_amd64.deb)
sha256sums=(416a112138f99e0f7e0f27ee7e15c83d8aed90b2ad680fcf75f2abcc9bfab2cb)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

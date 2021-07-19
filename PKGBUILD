# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
pkgver='2.4.0+a330c1a6_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.4.0+a330c1a6-1/u18/zivid-genicam_2.4.0+a330c1a6-1_amd64.deb)
sha256sums=(5f9bca4c765eb3c3a9c74f30cd8113be6e66c9234e0b487474b28576d9116d1f)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

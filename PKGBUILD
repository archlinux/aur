# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
pkgver='2.4.1+55718627_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.4.1+55718627-1/u18/zivid-genicam_2.4.1+55718627-1_amd64.deb)
sha256sums=(1309a9a73c859b0352014a182ec071701bd22e8a91678aab58b31a8853e6c8d1)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

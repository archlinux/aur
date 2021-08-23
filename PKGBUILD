# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
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

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.4.1+55718627-1/u18/zivid-studio_2.4.1+55718627-1_amd64.deb)
sha256sums=(19c63473165bf1d993c1fadf9512181504ed2347d80c9f423fffdcf4555d199e)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

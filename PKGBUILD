# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
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

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.3.0+a08763f1-1/u18/zivid-studio_2.3.0+a08763f1-1_amd64.deb)
sha256sums=(a38e5f6f074a0e4ed3d3b112f85a634a0570bf32fbe0c4e4d54b4a16fc205ed6)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='1.3.0+bb9ee328_10'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
optdepends=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.3.0+bb9ee328-10/u18/zivid-studio_1.3.0+bb9ee328-10_amd64.deb)
sha256sums=(2fded4a0b4ed21ac6e880fd834d03bff704398af4e1b7a459df018912e4daf19)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

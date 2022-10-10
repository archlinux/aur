# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.8.0+891708ba_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.8.0+891708ba-1/u18/zivid-tools_2.8.0+891708ba-1_amd64.deb)
sha256sums=(2753f0dc31a4101c5512b435089affc1041582a7b6a47da5c8b5eb22db31efe3)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.2.0+f0867d62_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.2.0+f0867d62-1/u18/zivid-tools_2.2.0+f0867d62-1_amd64.deb)
sha256sums=(07ca5f2296fb4e4b7354e55b7fb7712def3a1be44e43ae38f8a9e765904f98eb)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

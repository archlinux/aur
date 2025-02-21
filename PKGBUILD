# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.14.2+1a322f18_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.14.2+1a322f18-1/u20/zivid-tools_2.14.2+1a322f18-1_amd64.deb)
sha256sums=(23132ace0928b3359e4ed7a6a17a1c1822581254cfec1aa5ceeb87c8a2e82f34)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

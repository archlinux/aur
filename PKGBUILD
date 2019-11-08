# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='1.6.0+7a245bbe_26'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.6.0+7a245bbe-26/u18/zivid-tools_1.6.0+7a245bbe-26_amd64.deb)
sha256sums=(b86905ed93c59d2c39e369086ca3a0e1358fbbf95bed9c3dcab13690b85fcd08)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

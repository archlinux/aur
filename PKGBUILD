# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.16.0+46cdaba6_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.16.0+46cdaba6-1/u20/zivid-tools_2.16.0+46cdaba6-1_amd64.deb)
sha256sums=(da9fd04230c3cc2cfc39e8bace8b4ef40fe0bf2f7a4a0eb5b2fe7e807dd23646)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

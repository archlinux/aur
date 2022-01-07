# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.6.0+fa0036c5_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.6.0+fa0036c5-1/u18/zivid-tools_2.6.0+fa0036c5-1_amd64.deb)
sha256sums=(2f45988c027fb0e59f5eae59dc89717f00d717ae23afe0e682631ec0a02956ae)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

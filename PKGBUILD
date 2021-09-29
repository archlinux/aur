# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.4.2+1a2e8cfb_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.4.2+1a2e8cfb-1/u18/zivid-tools_2.4.2+1a2e8cfb-1_amd64.deb)
sha256sums=(defb806b9f33c5af6d372903dc4d2b59fd1a123a7b85bbab28cdc5705728c638)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

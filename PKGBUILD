# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.8.1+dd4dffea_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.8.1+dd4dffea-1/u18/zivid-tools_2.8.1+dd4dffea-1_amd64.deb)
sha256sums=(0b3a258535fce81350cee03a737910fc846ccb4a4f6b1d5d9216f5dbdfaec137)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

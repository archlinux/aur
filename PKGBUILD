# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
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

source=(https://downloads.zivid.com/sdk/releases/2.14.2+1a322f18-1/u20/zivid-genicam_2.14.2+1a322f18-1_amd64.deb)
sha256sums=(1fe81e8d067926c8e8c5738d0c63e560b21cb7d8aa03bc4f5f737bf033fbcc54)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
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

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.8.1+dd4dffea-1/u18/zivid-genicam_2.8.1+dd4dffea-1_amd64.deb)
sha256sums=(d950573ee1f9133803642d2aa081e13a5097a41678bd1b9abfee1e2920bb0114)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

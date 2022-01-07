# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
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

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.6.0+fa0036c5-1/u18/zivid-genicam_2.6.0+fa0036c5-1_amd64.deb)
sha256sums=(bd2b5929d66d4ad5bf8c2c3e015c44087ab6b39efed27653daa07902df58ad15)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

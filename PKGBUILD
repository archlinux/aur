# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
pkgver='2.12.0+6afd4961_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.12.0+6afd4961-1/u20/zivid-genicam_2.12.0+6afd4961-1_amd64.deb)
sha256sums=(029346c29521e78254aa2aca4fcf01908e4b8247545ed77f718597ee4865506d)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

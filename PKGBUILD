# Maintainer: John Ingve Schjølberg <john.schjolberg@zivid.com>

pkgname=zivid-genicam
pkgver='2.18.0+1b44dbef_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.18.0+1b44dbef-1/u20/zivid-genicam_2.18.0+1b44dbef-1_amd64.deb)
sha256sums=(04063d16f18b5a1fc02583a45a7faf07c6fab4c372097a07588a1ea6bbaccc51)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

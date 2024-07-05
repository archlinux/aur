# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
pkgver='2.13.1+18e79e79_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.13.1+18e79e79-1/u20/zivid-genicam_2.13.1+18e79e79-1_amd64.deb)
sha256sums=(4485e051dfb6ad650c0fff5579ff65b8b52f521950829e13ccc8abc104cb6828)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

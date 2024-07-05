# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
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

source=(https://downloads.zivid.com/sdk/releases/2.13.1+18e79e79-1/u20/zivid-studio_2.13.1+18e79e79-1_amd64.deb)
sha256sums=(4edcd000d5b3b2f3ede123a7545a5485c85ccae83fd502e491492eb41d6ded37)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

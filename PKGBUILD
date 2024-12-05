# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
pkgver='2.14.0+e4a0c4a9_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.14.0+e4a0c4a9-1/u20/zivid-genicam_2.14.0+e4a0c4a9-1_amd64.deb)
sha256sums=(d9e233130a012f3cf9f9e2993697e0fcb158d4a98ac8f04864fbe41927d9db77)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

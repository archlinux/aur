# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
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

source=(https://downloads.zivid.com/sdk/releases/2.13.1+18e79e79-1/u20/zivid-tools_2.13.1+18e79e79-1_amd64.deb)
sha256sums=(8e46e7be119b73b96ce413262b66f4cdb7bb4d5c58a513b8b3b0d0e0ab18b413)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

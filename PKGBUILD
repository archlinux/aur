# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.15.0+5fcc365b_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.15.0+5fcc365b-1/u20/zivid-tools_2.15.0+5fcc365b-1_amd64.deb)
sha256sums=(3b8b9899b0bc9deb763c407e5b087e8583a96bd46c68a5bce18aca7a0ba7cff4)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

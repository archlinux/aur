# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
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

source=(https://downloads.zivid.com/sdk/releases/2.12.0+6afd4961-1/u20/zivid-tools_2.12.0+6afd4961-1_amd64.deb)
sha256sums=(3d9658517d08c296fb131aea220b44f6a1b714b4850bc64acdbe9d28caa30647)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
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

source=(https://downloads.zivid.com/sdk/releases/2.12.0+6afd4961-1/u20/zivid-studio_2.12.0+6afd4961-1_amd64.deb)
sha256sums=(612e31885f23f72bbb017acaba1b231af3a04a188295d101304398b048ef2517)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

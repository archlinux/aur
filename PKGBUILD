# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='2.11.0+95829246_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.11.0+95829246-1/u20/zivid-studio_2.11.0+95829246-1_amd64.deb)
sha256sums=(3a975c06b79f80b92dd5362b344cb8bd14bb5d0673c4171dca69306ad5ada423)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

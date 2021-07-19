# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.4.0+a330c1a6_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.4.0+a330c1a6-1/u18/zivid-tools_2.4.0+a330c1a6-1_amd64.deb)
sha256sums=(d4d524c6215b512d93b25eea711e11ef3631d7298146d477439dd7b4436057b8)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='1.6.0+7a245bbe_26'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.6.0+7a245bbe-26/u18/zivid-studio_1.6.0+7a245bbe-26_amd64.deb)
sha256sums=(a3fe7a2455cb003951c5ed28000f806d7fa8ecf26e1d95a9500f68bc0d6c86af)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

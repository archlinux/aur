# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
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

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.4.0+a330c1a6-1/u18/zivid-studio_2.4.0+a330c1a6-1_amd64.deb)
sha256sums=(571140ce8a3eb6be4f67892d8e8cb94254d65d745967dbc70fcf5396f94c5dbd)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

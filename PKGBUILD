# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
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

source=(https://downloads.zivid.com/sdk/releases/2.15.0+5fcc365b-1/u20/zivid-genicam_2.15.0+5fcc365b-1_amd64.deb)
sha256sums=(b203c1510bbacda1613ee806354739aae6599337d1d673a8c4ab3ef7604fb211)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

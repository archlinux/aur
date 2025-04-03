# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
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

source=(https://downloads.zivid.com/sdk/releases/2.15.0+5fcc365b-1/u20/zivid-studio_2.15.0+5fcc365b-1_amd64.deb)
sha256sums=(8030a7be92d112ab4cfdd1c6d658db62db3c5fb6dfb917ab4a55ed72e294490b)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

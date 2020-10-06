# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='2.1.0+d2007e12_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.1.0+d2007e12-1/u18/zivid-studio_2.1.0+d2007e12-1_amd64.deb)
sha256sums=(c621d9746d3f35297002b2a137979cd2c1382001379b3c831d899de5e966c086)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='2.10.0+8ce7dae3_2'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.10.0+8ce7dae3-2/u20/zivid-studio_2.10.0+8ce7dae3-2_amd64.deb)
sha256sums=(4ca68f634a30d86fd58faa60cc6630eea4aac89a39a52af8ad5ea75b8e793900)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

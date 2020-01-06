# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
pkgver='1.8.0+89ae8b3e_39'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.8.0+89ae8b3e-39/u18/zivid-genicam_1.8.0+89ae8b3e-39_amd64.deb)
sha256sums=(3a27d96c7e7908c36a9ab388cb81ecc712a41e40bd8bd63cbe8ac32498eb6463)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

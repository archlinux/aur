# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.15.0+5fcc365b_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.15.0+5fcc365b-1/u20/zivid_2.15.0+5fcc365b-1_amd64.deb)
sha256sums=(86d643d14aa08ee26ef90ac1c3bf2a7816ee0d3a96c0156ac9b9d86bd20b5bac)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='1.8.1+6967bc1b_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.8.1+6967bc1b-1/u18/zivid_1.8.1+6967bc1b-1_amd64.deb)
sha256sums=(6667c5fc2bab8cf924eb3619d3894662744b2db30be6f6ffb1da0725310f0b58)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.5.0+19fa6891_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.5.0+19fa6891-1/u18/zivid_2.5.0+19fa6891-1_amd64.deb)
sha256sums=(7d770bcb982d39863ed0444d2208a3e6adbc1121039f41ce6c1c9751678c851e)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

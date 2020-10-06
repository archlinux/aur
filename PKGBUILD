# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.1.0+d2007e12_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.1.0+d2007e12-1/u18/zivid_2.1.0+d2007e12-1_amd64.deb)
sha256sums=(fb6fb479357ec1cca3d583c19ff98e0ae56a22a50eb5a54b2752137abbee3c21)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

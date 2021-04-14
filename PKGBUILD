# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.3.0+a08763f1_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.3.0+a08763f1-1/u18/zivid_2.3.0+a08763f1-1_amd64.deb)
sha256sums=(c731dc8f1071989c71068c3c697713d4ba22c0b7256946a42c7ce3756b85c90b)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

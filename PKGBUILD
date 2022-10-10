# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.8.0+891708ba_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.8.0+891708ba-1/u18/zivid_2.8.0+891708ba-1_amd64.deb)
sha256sums=(8d9a27ee9e7518482ec0f43f74e420932c747fc470774aa372663997c5bd2a27)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

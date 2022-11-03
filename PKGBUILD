# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.8.1+dd4dffea_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.8.1+dd4dffea-1/u18/zivid_2.8.1+dd4dffea-1_amd64.deb)
sha256sums=(008ea4f587c82678d29ca972e377a506374ffc084c38f7945264dd9be1c4a01d)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

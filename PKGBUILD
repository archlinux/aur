# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.10.0+8ce7dae3_2'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.10.0+8ce7dae3-2/u20/zivid_2.10.0+8ce7dae3-2_amd64.deb)
sha256sums=(87c45f6741efb24e40490fedc1774690df7f8b5436f165534200ec0d866fdd04)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

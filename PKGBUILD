# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.12.0+6afd4961_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(opencl-driver)
conflicts=(zivid-telicam-driver)
provides=(zivid-telicam-driver)

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.12.0+6afd4961-1/u20/zivid_2.12.0+6afd4961-1_amd64.deb)
sha256sums=(5dc4df94a5fcd6e0f64551f8b88791e6a8d1a3eea917d909c351a4e8d34ebaf0)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

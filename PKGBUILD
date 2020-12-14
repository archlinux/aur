# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.2.0+f0867d62_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.2.0+f0867d62-1/u18/zivid_2.2.0+f0867d62-1_amd64.deb)
sha256sums=(80f84b9318f186cddf3de17d0aee41eb72de69ed73131044fd443c0cc4bc8af6)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

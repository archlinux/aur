# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.6.0+fa0036c5_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.6.0+fa0036c5-1/u18/zivid_2.6.0+fa0036c5-1_amd64.deb)
sha256sums=(fc0219916e30f6bdedd5fb4d62264438ad9dd6e1626dd9be20a1a48d769866ad)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

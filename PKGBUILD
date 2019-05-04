# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-telicam-sdk
pkgver='2.0.0.1_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=()
optdepends=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.3.0+bb9ee328-10/u18/telicam-sdk_2.0.0.1-1_amd64.deb)
sha256sums=(16a12ed1f2bd0629db8579212f90180d487bfb63af7b4b3d754d22b258cbaa24)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

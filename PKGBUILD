# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.3.0+a08763f1_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.3.0+a08763f1-1/u18/zivid-tools_2.3.0+a08763f1-1_amd64.deb)
sha256sums=(da2962221f6b4e7b2723dff9f447fdcb4d7e088bbe35d397f388699df341d352)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

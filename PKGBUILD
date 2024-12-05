# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.14.0+e4a0c4a9_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.14.0+e4a0c4a9-1/u20/zivid_2.14.0+e4a0c4a9-1_amd64.deb)
sha256sums=(212405d139cd89f07938301c0f7166dfccbc6f4a210d6a7caa2ce6fff5bffc1e)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

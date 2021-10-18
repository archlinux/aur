# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='2.5.0+19fa6891_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.5.0+19fa6891-1/u18/zivid-studio_2.5.0+19fa6891-1_amd64.deb)
sha256sums=(727d01f5b4775a5b8f15cf26c44b0c02e926b8a63880543725b6fa102c58737d)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

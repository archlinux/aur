# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.4.1+55718627_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.4.1+55718627-1/u18/zivid_2.4.1+55718627-1_amd64.deb)
sha256sums=(4a19491be81c0d26fca10ec7ba6394a326010317873a4bff913027ec8ea8aa2e)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

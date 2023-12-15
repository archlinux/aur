# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.11.0+95829246_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid-telicam-driver opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.11.0+95829246-1/u20/zivid_2.11.0+95829246-1_amd64.deb)
sha256sums=(ed91838de52bd11550894ae2940d84730aa5b5b84e309d02fd8547155d153142)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

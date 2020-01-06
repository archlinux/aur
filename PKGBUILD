# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='1.8.0+89ae8b3e_39'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.8.0+89ae8b3e-39/u18/zivid-tools_1.8.0+89ae8b3e-39_amd64.deb)
sha256sums=(cee25ff5779c1737e822aabee6b8de3149797f79946c92fe6c162f1d63bd3dd7)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

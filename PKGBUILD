# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='1.8.1+6967bc1b_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.8.1+6967bc1b-1/u18/zivid-studio_1.8.1+6967bc1b-1_amd64.deb)
sha256sums=(33aa1e6387a06639a5a4e895e7d7a1ab620a846812cb4e5a0b3a4eed8c31656c)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.7.0+e31dcbe2_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.7.0+e31dcbe2-1/u18/zivid-tools_2.7.0+e31dcbe2-1_amd64.deb)
sha256sums=(a82406b40aa013beb4d7e5c06b91b6e261ca46809ac84c0898e9f8387faddcb3)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
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

source=(https://www.zivid.com/hubfs/softwarefiles/releases/1.8.1+6967bc1b-1/u18/zivid-tools_1.8.1+6967bc1b-1_amd64.deb)
sha256sums=(c4ce401c3d659d2e683baa6b2f132a8ef3fef49ff15fb2fe5ce2430aa57f8340)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

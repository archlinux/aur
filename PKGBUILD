# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.14.0+e4a0c4a9_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.14.0+e4a0c4a9-1/u20/zivid-tools_2.14.0+e4a0c4a9-1_amd64.deb)
sha256sums=(47ba7c41183d03165550e268211438da8ebf02ff11d63ad262a7e675a12ff942)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

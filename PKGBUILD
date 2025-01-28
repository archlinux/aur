# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.14.1+b4e8f261_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.14.1+b4e8f261-1/u20/zivid-tools_2.14.1+b4e8f261-1_amd64.deb)
sha256sums=(11d0ecc19f3ce005d49ed52fb3a5133078916ee8c0f77be91792add5f46cdb78)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

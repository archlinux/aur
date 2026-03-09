# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-tools
pkgver='2.17.2+440b2367_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.17.2+440b2367-1/u20/zivid-tools_2.17.2+440b2367-1_amd64.deb)
sha256sums=(e54365caa24c25d0a0d67b9610b530ea32d618ff331e6699767d6637a8963b66)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

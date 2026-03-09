# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid
pkgver='2.17.2+440b2367_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(opencl-driver)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.17.2+440b2367-1/u20/zivid_2.17.2+440b2367-1_amd64.deb)
sha256sums=(4b329d4c873d577d9ef08b7cab759c06ff2e98d29218d24c87e3e284344d393c)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='2.8.1+dd4dffea_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://www.zivid.com/hubfs/softwarefiles/releases/2.8.1+dd4dffea-1/u18/zivid-studio_2.8.1+dd4dffea-1_amd64.deb)
sha256sums=(11e8c3e806ec181570d51a7c604a35de701e9b9dc7c2a8399e5f8b4dfc8fd7aa)

options=(!strip)

package() {
    bsdtar -xf data.tar.*z -C "${pkgdir}"
}

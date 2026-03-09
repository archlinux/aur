# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
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

source=(https://downloads.zivid.com/sdk/releases/2.17.2+440b2367-1/u20/zivid-studio_2.17.2+440b2367-1_amd64.deb)
sha256sums=(2ce4f1ae990ae1a76e516f1e6d39f3869e6956445b844c36f71a9a4d4d6df643)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

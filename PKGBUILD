# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-genicam
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

source=(https://downloads.zivid.com/sdk/releases/2.17.2+440b2367-1/u20/zivid-genicam_2.17.2+440b2367-1_amd64.deb)
sha256sums=(484a873a95d4e287e8c546b8840102a15255f7a1b3cc6e93eede4b5c1c97d426)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

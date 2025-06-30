# Maintainer: Mathias Nedrebø <mathias.nedrebo@zivid.com>

pkgname=zivid-studio
pkgver='2.16.0+46cdaba6_1'
pkgrel=1
pkgdesc='Defining the Future of 3D Machine Vision'
arch=('x86_64')
license=('custom')
url=https://www.zivid.com

depends=(zivid)
conflicts=()
provides=()

groups=(zivid-all)

source=(https://downloads.zivid.com/sdk/releases/2.16.0+46cdaba6-1/u20/zivid-studio_2.16.0+46cdaba6-1_amd64.deb)
sha256sums=(58269dd84fe275fb3144e0a87f03b96cc24e3691c00edcc995b6694c5839791b)

options=(!strip)

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}

# Maintainer: dongdongbh <dongdongbhbh@gmail.com>
pkgname=mindwtr-bin
pkgver=1.3.5
pkgrel=1
pkgdesc="A complete Getting Things Done (GTD) productivity system - Mind Like Water"
arch=('x86_64')
url="https://github.com/dongdongbh/Mindwtr"
license=('AGPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3')
optdepends=('evolution-data-server: GNOME system calendar integration')
provides=('mindwtr')
conflicts=('mindwtr')
source_x86_64=("${url}/releases/download/v${pkgver}/mindwtr_${pkgver}_amd64.deb")
sha256sums_x86_64=('a7cbb824313ddf026f362951c902a076045df7f4b404c5aef2d52aa4cae130d2')

package() {
    tar -xf data.tar.zst -C "${pkgdir}" || tar -xf data.tar.gz -C "${pkgdir}"
}

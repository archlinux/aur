# Maintainer: dongdongbh <dongdongbhbh@gmail.com>
pkgname=mindwtr-bin
pkgver=1.2.1
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
sha256sums_x86_64=('a287a3a7e4daa8ebac6d3c649c53d293ba6054e6f3938cf299792499328fdc74')

package() {
    tar -xf data.tar.zst -C "${pkgdir}" || tar -xf data.tar.gz -C "${pkgdir}"
}

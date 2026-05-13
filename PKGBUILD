# Maintainer: dongdongbh <dongdongbhbh@gmail.com>
pkgname=mindwtr-bin
pkgver=0.9.3
pkgrel=1
pkgdesc="A complete Getting Things Done (GTD) productivity system - Mind Like Water"
arch=('x86_64')
url="https://github.com/dongdongbh/Mindwtr"
license=('AGPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3')
provides=('mindwtr')
conflicts=('mindwtr')
source_x86_64=("${url}/releases/download/v${pkgver}/mindwtr_${pkgver}_amd64.deb")
sha256sums_x86_64=('ab7abedf0394451315871b23dc0cd374729ea0c905ff70c016e6054a89abac44')

package() {
    tar -xf data.tar.zst -C "${pkgdir}" || tar -xf data.tar.gz -C "${pkgdir}"
}

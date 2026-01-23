# Maintainer: dongdongbh <dongdongbhbh@gmail.com>
pkgname=mindwtr-bin
pkgver=0.5.8
pkgrel=1
pkgdesc="A complete Getting Things Done (GTD) productivity system - Mind Like Water"
arch=('x86_64')
url="https://github.com/dongdongbh/Mindwtr"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3')
provides=('mindwtr')
conflicts=('mindwtr')
source_x86_64=("${url}/releases/download/v${pkgver}/mindwtr_${pkgver}_amd64.deb")
sha256sums_x86_64=('d77ebfd0a42412f0d18559caf416268d49190d15d4c8c3a7bbcfb3f4bda6b13b')

package() {
    tar -xf data.tar.zst -C "${pkgdir}" || tar -xf data.tar.gz -C "${pkgdir}"
}

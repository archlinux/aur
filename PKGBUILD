# Maintainer: dongdongbh <dongdongbhbh@gmail.com>
pkgname=mindwtr-bin
pkgver=0.6.19
pkgrel=1
pkgdesc="A complete Getting Things Done (GTD) productivity system - Mind Like Water"
arch=('x86_64')
url="https://github.com/dongdongbh/Mindwtr"
license=('AGPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3')
provides=('mindwtr')
conflicts=('mindwtr')
source_x86_64=("${url}/releases/download/v${pkgver}/mindwtr_${pkgver}_amd64.deb")
sha256sums_x86_64=('2b57b1b40907eb216d5a7b339e40e7e6f18f4228d23d917f8421b2ffad3d4640')

package() {
    tar -xf data.tar.zst -C "${pkgdir}" || tar -xf data.tar.gz -C "${pkgdir}"
}

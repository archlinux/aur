# Maintainer: Dmitry N <dmitnikon at_sign gmail . com>
pkgname=ttf-flexi-ibm-vga-false
pkgver=2.0
pkgrel=1
pkgdesc="Scalable TrueType monospace font based on the VGA character set"
arch=(any)
url="https://www.ffonts.net/Flexi-IBM-VGA-False.font"
license=('custom:Creative Commons Attribution-ShareAlike 4.0 International License')
makedepends=('unzip')
source=("$pkgname-$pkgver.zip::https://www.ffonts.net/Flexi-IBM-VGA-False.font.zip")
sha256sums=('e4a74c61d9a52b135dd790699b27cf019c8801a2a3fd3f28968262fde276f70f')

prepare() {
    unzip -o "$pkgname-$pkgver.zip"
}

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 Flexi_IBM_VGA_False.ttf "${pkgdir}/usr/share/fonts/TTF/Flexi-IBM-VGA-False.ttf"
    install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

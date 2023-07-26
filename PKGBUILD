# Maintainer: desbma
pkgname=ttf-icomoon-feather-git
pkgver=1.0
pkgrel=0
pkgdesc='Icomoon and Feather font icons'
arch=('any')
url='https://github.com/adi1090x/rofi/blob/master/fonts'
license=('GPL3')
conflicts=('ttf-icomoon-feather')
source=('icomoon-feather.ttf::https://github.com/adi1090x/rofi/blob/master/fonts/Icomoon-Feather.ttf?raw=true')
sha512sums=('807c896223158da8fa396bb10a5eb9769259c66deb44d7482ac47e1d5d6df4e75b5e33f3c411a49ca3453dc1875b03b1b8a59ded3c79417fbb1e75aea04dcf7d')

package() {
    install -Dm 644 -t "${pkgdir}/usr/share/fonts/TTF" icomoon-feather.ttf
}

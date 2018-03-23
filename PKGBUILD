# Maintainer: Yan Doroshenko <yandoroshenko@protonmail.com>

pkgname=asciiquarium-lock
pkgver=1.0
pkgrel=1
pkgdesc="Simple screen locker using ASCIIQuarium as a screensaver"
arch=('any')
url="https://github.com/YanDoroshenko/asciiquarium-lock"
license=('GPL')
depends=('awk' 'asciiquarium' 'xterm' 'xtrlock' 'xorg-server')
optdepends=('xkblayout-state: Restore the selected layout after unlock', 'xorg-xrandr: Multihead support')
source=("https://github.com/YanDoroshenko/"$pkgname"/raw/master/"$pkgname".sh")
sha256sums=('6aea815606759713185a07b4d66e1c716aedeeac391ffd41ae45f8ac2c893665')

package() {
    mkdir -p "$pkgdir"/usr/bin
    cp "$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
    chmod +x "$pkgdir"/usr/bin/"$pkgname"
}

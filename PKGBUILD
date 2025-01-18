# Maintainer:  Dan Johansen <strit@strits.dk>

pkgname=ttf-futurama-fonts
pkgver=1.0
pkgrel=2
pkgdesc='Fonts from or inspired by the hit cartoon Futurama'
arch=('any')
url='https://www.dafont.com/futurama.font'
license=('Unknown')
source=("$pkgname-$pkgver.zip::https://dl.dafont.com/dl/?f=futurama")
sha256sums=('41a706f4d9ae46659f0abed3627af680ea755371734f50cde8ecb13e55446a94')


package() {
    install -d "$pkgdir"/usr/share/fonts/TTF
    install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF
}

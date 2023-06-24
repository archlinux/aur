# Maintainer: qwjyh <urataw421 at gmail dot com>

pkgname=ttf-uzura-font
pkgver=1.00
pkgrel=2
pkgdesc="A handwritten font, which is a little thicker and rounder than Azukifont"
arch=('any')
url='http://azukifont.com/font/uzura.html'
license=('custom')
source=(http://azukifont.com/font/uzurafont100.zip
        'LICENSE')
sha256sums=('0cc1589532bfd27d509af4d601b3d3d38fd2b50d8a16b625e9f6310973d19af3'
            '2e68b7b2866a1f297d7a5fd47e74450450b2dbbc35ce12b65aced2b2aae8120c')

package() {
  install -Dm644 uzurafont100/*.ttf -t "$pkgdir"/usr/share/fonts/TTF
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

# Maintainer: qwjyh <urataw421 at gmail dot com>

pkgname=ttf-uzura-font
pkgver=1.00
pkgrel=1
pkgdesc="A handwritten font, which is a little thicker and rounder than Azukifont"
arch=('any')
url='http://azukifont.com/font/uzura.html'
license=('custom')
source=(http://azukifont.com/font/uzurafont100.zip)
sha256sums=('0cc1589532bfd27d509af4d601b3d3d38fd2b50d8a16b625e9f6310973d19af3')

package() {
  install -Dm644 uzurafont100/*.ttf -t "$pkgdir"/usr/share/fonts/TTF
}

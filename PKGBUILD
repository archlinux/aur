pkgname=archlogo-glyph
pkgver=1.0
pkgrel=1
pkgdesc="Arch Linux glyph (unicode e900).  See url below showing it."
url="https://raw.githubusercontent.com/duffydack/dotfiles/master/arch-glyph.png"
arch=('any')
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=(archlinux.ttf)
md5sums=('SKIP')
install=$pkgname.install
package() {
install -d "$pkgdir"/usr/share/fonts/TTF
install -Dm644 "$srcdir/archlinux.ttf" "$pkgdir/usr/share/fonts/TTF"
}

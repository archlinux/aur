pkgname=ttf-anka-coder-condensed
pkgver=1.100
pkgrel=2
pkgdesc="A monospaced font"
arch=('any')
url="https://code.google.com/archive/p/anka-coder-fonts"
license=('SIL Open Font License, 1.1')
depends=('fontconfig' 'xorg-font-util')
install=ttf.install
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/anka-coder-fonts/AnkaCoderCondensed.zip")
sha256sums=('985bf9a091bbdab93515c897289c885db7adef2a8756554110b5c3d0618cf955')

package() {
  cd "$srcdir"
  install -Dm644 AnkaCoder-C87-r.ttf "$pkgdir/usr/share/fonts/TTF/AnkaCoder-C87-r.ttf"
  install -Dm644 AnkaCoder-C87-i.ttf "$pkgdir/usr/share/fonts/TTF/AnkaCoder-C87-i.ttf"
  install -Dm644 AnkaCoder-C87-bi.ttf "$pkgdir/usr/share/fonts/TTF/AnkaCoder-C87-bi.ttf"
  install -Dm644 AnkaCoder-C87-b.ttf "$pkgdir/usr/share/fonts/TTF/AnkaCoder-C87-b.ttf"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

# vim:set ts=2 sw=2 et:

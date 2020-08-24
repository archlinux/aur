# Maintainer: kungfubeaner <kungfubeaner@yahoo.com>

pkgname=ttf-anka-coder
pkgver=1.100
pkgrel=1
pkgdesc="A monospaced font"
arch=('any')
url="https://code.google.com/archive/p/anka-coder-fonts"
license=('SIL Open Font License, 1.1')
depends=('fontconfig' 'xorg-mkfontscale')
install=ttf.install
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/anka-coder-fonts/AnkaCoder.zip")
sha256sums=('3c3cd48ed57796cd490a2c22614c73e32ad202790d10e9af3d632cd985c0e172')

package() {
  cd "$srcdir"
  install -Dm644 AnkaCoder-r.ttf "$pkgdir/usr/share/fonts/TTF/AnkaCoder-r.ttf"
  install -Dm644 AnkaCoder-i.ttf "$pkgdir/usr/share/fonts/TTF/AnkaCoder-i.ttf"
  install -Dm644 AnkaCoder-bi.ttf "$pkgdir/usr/share/fonts/TTF/AnkaCoder-bi.ttf"
  install -Dm644 AnkaCoder-b.ttf "$pkgdir/usr/share/fonts/TTF/AnkaCoder-b.ttf"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

# vim:set ts=2 sw=2 et:

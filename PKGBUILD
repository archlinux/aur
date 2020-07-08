# Maintainer Lauri Niskanen<ape@ape3000.com>

pkgname=montecarlo-font
pkgver=1
pkgrel=3
pkgdesc="A monospace font, created by programmers, for programmers"
url="http://bok.net/MonteCarlo/"
license=(custom)
arch=(any)
depends=(fontconfig xorg-fonts-encodings xorg-mkfontscale)
install=font.install
source=(http://bok.net/MonteCarlo/downloads/MonteCarlo-PCF.tgz)
md5sums=('503ecb321266fdd2b2baa0a052d8543c')

package() {
  local _fontdir=$pkgdir/usr/share/fonts/misc/

  cd "$srcdir/MonteCarlo-PCF"

  gzip *
  install -d "$_fontdir"
  install -m644 * "$_fontdir"
}

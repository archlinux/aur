pkgname=ttf-monolisa-font
pkgver=1.1
pkgrel=1
pkgdesc="MonoLisa TrueType font, must own the fonts"
arch=('any')
url="https://www.monolisa.dev/"
license=('FaceType - EULA')
depends=(
  'fontconfig'
  'ttf-nerd-fonts-symbols'
)
source=('https://github.com/CharacterHorse/MyFont/releases/download/1.1/fonts.tar.gz')
sha256sums=('9720ce775019d5517112af6daa0086ae601ab5060bf7c399f491d430c80f9e5c')
install=monolisa-font.install
package() {
  install -d "$pkgdir/usr/share/fonts/TTF/MonoLisa"

  install -m644 MonoLisa/*.ttf \
    "$pkgdir/usr/share/fonts/TTF/MonoLisa/"
}

# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Sajeev Ramasamy <thorion3006@gmail.com>
pkgname=(ttf-kascadia)
pkgver=v2108.26
pkgrel=1
pkgdesc='Cascadia Powerline fonts patched with missing glyphs from nerd font.'
arch=(any)
url="https://github.com/thorion3006/kascadia_font"
license=(OFL)
source=("$url/releases/download/$pkgver/Kascadia-$pkgver.zip")
sha256sums=('b6bf715cbec8215dd7d8ee419253bcaa7a85a799da6bfb28743ec1778e97834d')

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/kascadia" fonts/*.ttf
}

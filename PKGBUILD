# Contributor: Andrew Rabert <draje@nullsum.net>

pkgname=tamzen-font
pkgver=1.11.4
pkgrel=1
pkgdesc="A monospaced bitmap font for the console and X11 (tamsyn-font fork)"
arch=('any')
url="https://github.com/sunaku/tamzen-font"
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=tamzen-font.install
source=("https://github.com/sunaku/tamzen-font/archive/Tamzen-${pkgver}.tar.gz")
sha256sums=('da677aaa4bb7a30fd23f92c0e93b6a3e66ca27817561390ec78a476cee3bcde7')

_srcname="tamzen-font-Tamzen-${pkgver}"


package () {
  cd "$srcdir/$_srcname"

  install -d "$pkgdir/usr/share/fonts/local"
  install -m644 bdf/*.bdf "$pkgdir/usr/share/fonts/local/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
}

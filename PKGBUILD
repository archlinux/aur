# Maintainer: Roman Holovin <https://wiki.archlinux.org/index.php/Special:EmailUser/Dantix>

pkgname=ttf-apl385
pkgver=1.0.0
pkgrel=1

pkgdesc="Unicode monospaced font"
url="http://apl385.com/fonts/index.htm"
license=('custom:"Public Domain"')

arch=('any')
source=("http://apl385.com/fonts/apl385.zip")
sha256sums=('2fccdb3137bc985fb5977c5e6b05f93611b277a46ef8883a72d86cd0ad76588c')

package() {
  cd "$srcdir"

  install -d "$pkgdir"/usr/share/fonts/TTF
  install -m644 *.ttf "$pkgdir"/usr/share/fonts/TTF
}

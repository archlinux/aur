pkgname=univga
pkgver=1.0
pkgrel=3
pkgdesc="(X11) VGA font with unicode glyphs by Dmitry Yu. Bolkhovityanov"
arch=('any')
url="http://www.inp.nsk.su/~bolkhov/files/fonts/univga/"
license=('MIT')
groups=()
depends=()
makedepends=('xorg-font-utils')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=univga.install
changelog=
source=('http://www.inp.nsk.su/~bolkhov/files/fonts/univga/uni-vga.tgz')
noextract=()
md5sums=('60fbba53cb0efec1363fcc5fb8c244d9')

package() {
  cd "$srcdir"/uni_vga

  install -m 644 -D u_vga16.bdf \
    "$pkgdir"/usr/share/fonts/local/u_vga16.bdf
}

# vim:set ts=2 sw=2 et:

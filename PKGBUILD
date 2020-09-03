# Maintainer: Sean Greenslade <aur AT seangreenslade DOT com>
pkgname=vim-openscad
pkgver=r16.81db508
pkgrel=1
pkgdesc="Vim syntax highlighting for OpenSCAD files"
arch=('any')
url=""
license=('Public Domain')
groups=()
depends=()
makedepends=(git)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=('git+https://github.com/sirtaj/vim-openscad.git')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/vim-openscad/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm644 "$srcdir/vim-openscad/syntax/openscad.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/openscad.vim"
  install -Dm644 "$srcdir/vim-openscad/ftdetect/openscad.vim" "$pkgdir/usr/share/vim/vimfiles/ftdetect/openscad.vim"
  install -Dm644 "$srcdir/vim-openscad/ftplugin/openscad.vim" "$pkgdir/usr/share/vim/vimfiles/ftplugin/openscad.vim"
#install -Dm755 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

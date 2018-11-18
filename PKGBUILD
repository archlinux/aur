# Maintainer: Simona <simona.pisano[at]gmail[dot]com>
pkgname=simona-konsole-colorscheme-custom
pkgver=0.0.1
pkgrel=1
pkgdesc="Custom color-theme for Konsole"

arch=('any')
license=('GPL3')

depends=('konsole>=17')
#optdepends=('' '')

source=("simona-breezamod-white-on-black-custom.colorscheme")

md5sums=('c2ce3a8353b1444de7cb3471202cd0de')

package() {
  cd "$srcdir"
  install -Dm600 "$srcdir/simona-breezamod-white-on-black-custom.colorscheme" "$HOME/.local/share/konsole/simona-breezamod-white-on-black-custom.colorscheme"
}













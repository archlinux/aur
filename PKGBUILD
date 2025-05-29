# Maintainer: lambrou <alexanderlambrou0602@gmail.com>
pkgname=catv
pkgver=1.0.0
pkgrel=1
pkgdesc="Clipboard utility supporting text and binary files"
arch=('any')
url="https://github.com/lambroulabs/catv"
license=('MIT')
depends=('bash')
optdepends=(
  'wl-clipboard: for Wayland clipboard support'
  'xclip: for X11 clipboard support'
  'xsel: alternative X11 clipboard tool'
  'pbcopy: macOS clipboard support'
)
source=('catv')
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir/catv" "$pkgdir/usr/bin/catv"
}

# Maintainer: archcrack <leo.clifm@outlook.com>

pkgname=clifm-colors-git
_pkgname=clifm-colors
pkgver=0.1.0
pkgrel=3
pkgdesc="Some color schemes for the Clifm file manager"
arch=(any)
url="https://github.com/leo-arch/clifm-colors"
license=(GPL2+)
depends=('clifm')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/usr/share/clifm"
  cp -r colors "$pkgdir/usr/share/clifm"
}

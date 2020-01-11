# Maintainer: jxir <aur@jxir.de>

pkgname=llf
pkgver=0.6
pkgrel=1
pkgdesc="A LaTeX reformatter / beautifier"
arch=('any')
url="https://repo.or.cz/llf.git"
license=('custom')
depends=('lua-lpeg' 'lua-wcwidth')
makedepends=('git')
source=("git+https://repo.or.cz/$pkgname.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

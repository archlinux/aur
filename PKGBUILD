pkgname=abnt2-ext
pkgver=2.1.1
pkgrel=1
pkgdesc="ABNT2 extended keyboard"
arch=(any)
url="https://github.com/kugland/abnt2-ext-arch"
license=('GPL')
depends=(xkeyboard-config)
source=("https://github.com/kugland/$pkgname-arch/archive/refs/tags/v$pkgver.tar.gz")
install="$pkgname.install"
sha256sums=('2bec38fb75b7750fd8388e814b6e99d47d029cbcdb7d6025e0b809ce2f73f574')

package() {
  cd "$srcdir/$pkgname-arch-$pkgver"
  install -D -m 644 -o root -g root abnt2_ext "$pkgdir/usr/share/X11/xkb/symbols/abnt2_ext"
}

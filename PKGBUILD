# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=adwaita-ex
pkgver=0.1.3
pkgrel=1
pkgdesc="Extra icons for Adwaita icon theme"
arch=("any")
url="https://github.com/jonian/adwaita-ex"
license=("GPL")
depends=("adwaita-icon-theme")
source=("$pkgname-$pkgver.tag.gz::https://github.com/jonian/adwaita-ex/archive/v$pkgver.tar.gz")
md5sums=('25dd2d2770350493abba018c2d129e15')

package() {
  mkdir -p "$pkgdir/usr/share/icons"
  cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/share/icons/AdwaitaEX"
}

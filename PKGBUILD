# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=adwaita-ex
pkgver=0.1.5
pkgrel=1
pkgdesc="Extra icons for Adwaita icon theme"
arch=("any")
url="https://github.com/jonian/adwaita-ex"
license=("GPL")
depends=("adwaita-icon-theme")
source=("$pkgname-$pkgver.tag.gz::https://github.com/jonian/adwaita-ex/archive/v$pkgver.tar.gz")
md5sums=('f516b12ce751b7c8524600f90e23c180')

package() {
  mkdir -p "$pkgdir/usr/share/icons"
  cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/share/icons/AdwaitaEX"
}

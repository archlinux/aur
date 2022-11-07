# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=adwaita-ex
pkgver=0.1.1
pkgrel=1
pkgdesc="Extra icons for Adwaita icon theme"
arch=("any")
url="https://github.com/jonian/adwaita-ex"
license=("GPL")
depends=("adwaita-icon-theme")
source=("$pkgname-$pkgver.tag.gz::https://github.com/jonian/adwaita-ex/archive/v$pkgver.tar.gz")
md5sums=('edeea4b975612122401eb3dc96991a27')

package() {
  mkdir -p "$pkgdir/usr/share/icons"
  cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/share/icons/AdwaitaEX"
}

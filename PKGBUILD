# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=adwaita-ex
pkgver=0.1.2
pkgrel=1
pkgdesc="Extra icons for Adwaita icon theme"
arch=("any")
url="https://github.com/jonian/adwaita-ex"
license=("GPL")
depends=("adwaita-icon-theme")
source=("$pkgname-$pkgver.tag.gz::https://github.com/jonian/adwaita-ex/archive/v$pkgver.tar.gz")
md5sums=('1e9b3ba9096737fd58173f2fa5382254')

package() {
  mkdir -p "$pkgdir/usr/share/icons"
  cp -a "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/share/icons/AdwaitaEX"
}

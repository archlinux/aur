# Maintainer Chris Werner Rau <aur@cwrau.io>

_pkgname=rofi-randr
pkgname=$_pkgname
pkgver=1.0.0
pkgrel=0
pkgdesc="Script to work configure xorg via rofi"
license=('GPL2')
arch=('any')
depends=('xorg-xrandr' 'dmenu')
source=('rofi-randr::https://raw.githubusercontent.com/carnager/scripts/master/rofi-randr')
sha512sums=('7d792bf10d2567058f40c46a2e0dfb82dc8a6fe7ed9f7514c92d70698c93bd58e7869c341375cfc2295b2a7335b0420dcd984d19e34073ceb2943987f0bed191')
conflicts=("$_pkgname" "${_pkgname}-git")

package() {
	install -D -t "$pkgdir/usr/bin" "$srcdir/$pkgname"
}

#vim: syntax=sh

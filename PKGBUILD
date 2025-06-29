
# Maintainer: Your Name <you@example.com>
pkgname=fortunafetch
pkgver=2.1
pkgrel=3
pkgdesc="THE BEST FETCH IN THE WORLD OF ALL EXISTING. 100% FASTER THAN FASTFETCH AND NEOFETCH. PROVEN BY SCIENTISTS.( The following project is a meme and was made for fun dont take it seriously )"
arch=('any')
url="https://github.com/alexskid/fortunafetch"  # Рекомендую заменить на GitHub или другой реальный URL
license=('GPL 3.0')
depends=('xorg-xrandr' 'lsb-release' 'pciutils' 'inetutils' 'procps-ng')  # нужные зависимости
source=("$pkgname".sh)
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}

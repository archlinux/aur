
# Maintainer: Your Name <you@example.com>
pkgname=fortunafetch
pkgver=1.0
pkgrel=1
pkgdesc="Fancy ASCII system info fetch script like neofetch"
arch=('any')
url="https://github.com/alexskid/fortunafetch"  # Рекомендую заменить на GitHub или другой реальный URL
license=('MIT')
depends=('xorg-xrandr' 'lsb-release' 'pciutils' 'inetutils' 'procps-ng')  # нужные зависимости
source=("$pkgname")
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

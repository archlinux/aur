# Maintainer: Alesh Slovak <aleshslovak@gmail.com>

pkgname=steam-tweaks
pkgver=0.1.2
pkgrel=1
pkgdesc="Various tools for tweaking Steam/game settings"
arch=('any')
url="https://github.com/gamer-os/steam-tweaks"
license=('MIT')
depends=('python' 'python-yaml' 'python-vdf' 'pycrc')
source=("https://github.com/gamer-os/steam-tweaks/archive/$pkgver.tar.gz")
md5sums=('7ece75133cec234eb16450d4a1963956')

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m 755 "$srcdir/steam-tweaks-$pkgver/proton-whitelist" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/steam-tweaks-$pkgver/steam-input-whitelist" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/steam-tweaks-$pkgver/steam-grid-cache" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/steam-tweaks-$pkgver/steam-shortcuts" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/steam-tweaks-$pkgver/steam-tweaks" "$pkgdir/usr/bin"
}

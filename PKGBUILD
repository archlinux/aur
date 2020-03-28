# Maintainer: Alesh Slovak <aleshslovak@gmail.com>

pkgname=steam-tweaks
pkgver=0.3.1
pkgrel=1
pkgdesc="Various tools for tweaking Steam/game settings"
arch=('any')
url="https://github.com/gamer-os/steam-tweaks"
license=('MIT')
depends=('python' 'python-yaml' 'python-vdf' 'pycrc')
source=("https://github.com/gamer-os/steam-tweaks/archive/$pkgver.tar.gz")
md5sums=('610f2cee0c0c53d43bfee43b8995b897')

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m 755 "$srcdir/steam-tweaks-$pkgver/steam-config" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/steam-tweaks-$pkgver/steam-grid-cache" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/steam-tweaks-$pkgver/steam-shortcuts" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/steam-tweaks-$pkgver/steam-tweaks" "$pkgdir/usr/bin"
  install -m 755 "$srcdir/steam-tweaks-$pkgver/tweaks-mfplat" "$pkgdir/usr/bin"
}

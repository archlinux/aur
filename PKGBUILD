# Maintainer: menaouer <chaabi.menaouer@gmail.com>
pkgname=einfach-icon-theme
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple GTK icon theme with multiple color variants"
arch=('any')
url="https://github.com/DerJimno/einfach-icon-theme"
license=('CC BY-SA 4.0')
depends=()
makedepends=()
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # run `makepkg -g` to replace

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Run your installer script, but force destination inside $pkgdir
  ./install.sh -a -d "$pkgdir/usr/share/icons"
}

# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
# Project: nwg-shell for sway, https://github.com/nwg-piotr/nwg-shell

pkgname=('nwg-shell-wallpapers')
pkgver=0.1.4
pkgrel=2
pkgdesc="nwg-shell wallpapers package"
arch=('any')
url="https://github.com/nwg-piotr/nwg-shell-wallpapers"
license=('CC0-1.0')
provides=('nwg-shell-wallpapers')

source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-shell-wallpapers/archive/v"$pkgver".tar.gz")

md5sums=('7aa66923cd9656570c750e3b5975de7e')

package() {
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/backgrounds/nwg-shell
  install -Dm644 "$pkgname"-"$pkgver"/wallpapers/* $pkgdir/usr/share/backgrounds/nwg-shell/

  install -D -t "$pkgdir"/usr/share/licenses/"$pkgname" LICENSE
  install -D -t "$pkgdir"/usr/share/doc/"$pkgname" README.md
}

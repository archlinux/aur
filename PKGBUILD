# Maintainer : therock
pkgname=aurroamer
pkgver=2.0.0
pkgrel=6
pkgdesc="Interactive terminal-based browser for AUR and official packages"
arch=('any')
url="https://github.com/therock444/aurroamer"
license=('MIT')
depends=('bash' 'fzf' 'pacman')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/therock444/aurroamer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6c30f6319e777705a741990b63249331fed23dbebffbe1035b9b617623485a03')

package() {
  install -Dm755 "$pkgname-$pkgver/aurroamer" "$pkgdir/usr/bin/aurroamer"
}

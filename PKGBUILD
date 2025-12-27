# Maintainer: daonm <daobilionusd@gmail.com>
pkgname=gopac-bin
_pkgname=gopac
pkgver=1.2.1
pkgrel=1
pkgdesc="A warm Gruvbox TUI for pacman and AUR (Binary)"
arch=('x86_64')
options=('!debug')
url="https://github.com/the-daonm/gopac"
license=('MIT')
depends=('pacman')
provides=('gopac')
conflicts=('gopac' 'gopac-git')
source=("gopac::$url/releases/download/v$pkgver/gopac")
sha256sums=('490fef6d3cf1bc941c95307e7ba348b23385c44b52b8f05eb843ca95b1780fe8')

package() {
  install -Dm755 gopac "$pkgdir/usr/bin/gopac"
}

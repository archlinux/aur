# Maintainer: daonm <daobilionusd@gmail.com>
pkgname=gopac-bin
_pkgname=gopac
pkgver=1.2.3
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
sha256sums=('310eb33b2d96a88994e888d9d5e4c1bd0f58e683bbd9eb5573617baff4d8de38')

package() {
  install -Dm755 gopac "$pkgdir/usr/bin/gopac"
}

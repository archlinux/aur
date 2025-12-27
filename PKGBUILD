# Maintainer: daonm <daobilionusd@gmail.com>
pkgname=gopac-bin
_pkgname=gopac
pkgver=1.2.2
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
sha256sums=('e0ddf12263935d7134d9a361b345e89e8804e1f3d4cbbdff722af5d87c6b823d')

package() {
  install -Dm755 gopac "$pkgdir/usr/bin/gopac"
}

# Maintainer: daonm <daobilionusd@gmail.com>
pkgname=gopac-bin
_pkgname=gopac
pkgver=1.3.0
pkgrel=1
pkgdesc="A warm Gruvbox TUI for pacman and AUR (Binary)"
arch=('x86_64')
options=('!debug')
url="https://github.com/the-daonm/gopac"
license=('MIT')
depends=('pacman')
provides=('gopac')
conflicts=('gopac' 'gopac-git')
source=("gopac::$url/releases/download/v$pkgver/gopac" "gopac.fish::$url/releases/download/v$pkgver/gopac.fish")
sha256sums=('8ecea276ff565e931aee513a33731d84ba12f15b08f6b9e2d04da4c752fc2824' '54feeb751e7b2d3295004205cc66b3615713fb33f90fb19e651beb04807c432d')

package() {
  install -Dm755 gopac "$pkgdir/usr/bin/gopac"
}

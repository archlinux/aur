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
sha256sums=('f6d4c087c66184f9ba58cc7aaabe3897aad15a61e42d78c36629609ad0e7ed67' '54feeb751e7b2d3295004205cc66b3615713fb33f90fb19e651beb04807c432d')

package() {
  install -Dm755 gopac "$pkgdir/usr/bin/gopac"
}

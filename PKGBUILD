# Maintainer: daonm <daobilionusd@gmail.com>
pkgname=gopac-bin
_pkgname=gopac
pkgver=1.1.0
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
sha256sums=('4e71cf013efabe612427398993c53efa829c8740baef4e8a307a9e7b29f937e9')

package() {
  install -Dm755 gopac "$pkgdir/usr/bin/gopac"
}

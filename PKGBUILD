# Maintainer: akku <akkun11.open (at) gmail.com>

pkgname=auto-aur-mirrorlist
pkgver=20260606
pkgrel=1
pkgdesc="Auto-AUR mirrorlist to use with Pacman"
arch=('any')
url="https://auto-aur.pages.dev/"
license=('GPL')
backup=("etc/pacman.d/auto-aur-mirrorlist")
source=("mirrorlist")

package() {
  mkdir -p "$pkgdir/etc/pacman.d"
  install -m644 "$srcdir/mirrorlist" "$pkgdir/etc/pacman.d/auto-aur-mirrorlist"
}

sha256sums=("0610076356852d4d142cc5a0578056c072a8405e5f618cfc6b26c55dbc1f4862")

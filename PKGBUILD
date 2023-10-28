# Maintainer: D3vil0p3r <vozaanthony[at]gmail[dot]com>

pkgname=plasma5-themes-macsonoma-git
pkgver=r15.9741327
pkgrel=1
pkgdesc="MacOS Sonoma theme for KDE Plasma."
arch=('any')
url="https://github.com/vinceliuice/MacSonoma-kde"
license=("LGPL3")
depends=()
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  ./install.sh --round -d "$pkgdir/usr"
}

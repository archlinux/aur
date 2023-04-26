# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=hyprshotgun
pkgver=1.0
pkgrel=3
pkgdesc="Utility to take screenshots to the cloud (or save them locally)"
arch=(any)
url="https://github.com/Zeioth/wofi-calc.git"
license=('GPL')
depends=('wl-clipboard' 'libnotify' 'imagemagick' 'grimblast')
provides=(hyprshotgun)
conflicts=(hyprshotgun-git)
source=("git+$url")
sha256sums=('SKIP')

package() {
  mkdir -p "$pkgdir"/usr/bin
  install -Dm555 "${srcdir}"/wofi-calc/wofi-calc.sh "$pkgdir/usr/bin/hyprshotgun"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

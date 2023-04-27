# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=hyprshotgun
pkgver=1.1
pkgrel=6
pkgdesc="Utility to take screenshots to the cloud (or save them locally)"
arch=(any)
url="https://github.com/Zeioth/hyprshotgun.git"
license=('GPL')
depends=('wl-clipboard' 'libnotify' 'imagemagick' 'grimblast')
provides=(hyprshotgun)
conflicts=(hyprshotgun-git)
source=("git+$url")
sha256sums=('SKIP')

package() {
  mkdir -p "$pkgdir"/usr/bin
  install -Dm555 "${srcdir}"/hyprshotgun/hyprshotgun "$pkgdir/usr/bin/hyprshotgun"
  install -Dm644 "${srcdir}"/hyprshotgun/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

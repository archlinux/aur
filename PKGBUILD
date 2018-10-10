# Maintainer: takiz <tacidd@gmail.com>

pkgname=aur-search-git
pkgver=1.0
pkgrel=1
pkgdesc="Arch Linux search tool for AUR"
arch=(any)
url="https://github.com/takiz/aur-search"
license=(MIT)
depends=(bash jq coreutils util-linux)
source=(https://github.com/takiz/aur-search/archive/$pkgver.tar.gz)
sha256sums=('362244aebe3a02e978bef3d95d335d19459725770369c9c8a6391a4b32282ffd')

package() {
  cd aur-search-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/aur-search-git/LICENSE"
}

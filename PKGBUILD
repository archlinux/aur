# Maintainer: Joseph Diza <josephm.diza@gmail.com>
pkgname=marwaita-icons-git
pkgver=20200718
pkgrel=1
pkgdesc="Icon pack for linux"
arch=('any')
url="https://github.com/darkomarko42/Marwaita-Icons"
license=('custom')
makedepends=('git')
_pkgname=Marwaita-Icons
source=("${_pkgname}::git+https://github.com/darkomarko42/Marwaita-Icons")
sha256sums=('SKIP')

package() {
  cd "$_pkgname"

  ICON_DIR="$pkgdir/usr/share/icons"
  mkdir -p "$ICON_DIR"
  cp -rf "Marwaita" "$ICON_DIR"
  cp -rf "Marwaita-Dark" "$ICON_DIR"
  cp -rf "Marwaita-Light" "$ICON_DIR"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

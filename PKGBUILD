# Maintainer: Cedrik Hoffmann <choffmann@progeek.de>
pkgname=progeek-loading-plymouth-theme-git
pkgver=d29e42d
pkgrel=1
pkgdesc="Progeek loading animation theme for plymouth"
arch=("any")
url=""
license=('GPL')
depends=('plymouth')
source=("git+https://github.com/choffmann/progeek-loading-plymouth-theme.git")
md5sums=('SKIP')

pkgver() {
  cd $srcdir/progeek-loading-plymouth-theme
  git rev-parse --short HEAD
}

package() {
  mkdir -p "$pkgdir/usr/share/plymouth/themes"
  cp -r "$srcdir/progeek-loading-plymouth-theme/plymouth-theme" "$pkgdir/usr/share/plymouth/themes/progeek_loading"
}

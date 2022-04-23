# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=pnpm-bin
pkgver=6.32.9
pkgrel=1
pkgdesc="Fast, disk space efficient package manager"
arch=("x86_64")
url="https://github.com/pnpm/pnpm"
license=("MIT License")
options=("!strip")
provides=("pnpm")
conflicts=("pnpm" "pnpm-git")
source=("pnpm-$pkgver::$url/releases/download/v${pkgver}/pnpm-linux-x64")
sha256sums=('e9f965c5fed2b6a02ef7d2063bfc0eb39cc9922ccd9889e13cce1f77a8ffa7db')

package() {
  install -d "$pkgdir/usr/bin"
  cp -L "$srcdir/pnpm-$pkgver" "$pkgdir/usr/bin/pnpm"
  chmod +x "$pkgdir/usr/bin/pnpm"
}

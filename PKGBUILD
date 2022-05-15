# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=pnpm-bin
pkgver=7.1.0
pkgrel=1
pkgdesc="Fast, disk space efficient package manager"
arch=("x86_64")
url="https://github.com/pnpm/pnpm"
license=("MIT License")
options=("!strip")
provides=("pnpm")
conflicts=("pnpm" "pnpm-git")
source=("pnpm-$pkgver::$url/releases/download/v${pkgver}/pnpm-linux-x64")
sha256sums=('c503f242acd70779c8f257bc5240d7ebd6b1c025848ff41726ab3b39f6da64e8')

package() {
  install -d "$pkgdir/usr/bin"
  cp -L "$srcdir/pnpm-$pkgver" "$pkgdir/usr/bin/pnpm"
  chmod +x "$pkgdir/usr/bin/pnpm"
}

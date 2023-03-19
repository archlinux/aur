# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=pnpm-bin
pkgver=7.30.0
pkgrel=1
pkgdesc="Fast, disk space efficient package manager"
arch=("x86_64")
url="https://github.com/pnpm/pnpm"
license=("MIT License")
options=("!strip")
provides=("pnpm")
conflicts=("pnpm" "pnpm-git")
source=("pnpm-$pkgver::$url/releases/download/v${pkgver}/pnpm-linux-x64")
sha256sums=('df8ecd86bda58696a1a20b76dca42920c0df47db710014772d9b9590ff01c8f4')

package() {
  install -D "$srcdir/pnpm-$pkgver" "$pkgdir/usr/bin/pnpm"
  chmod +x "$pkgdir/usr/bin/pnpm"
}

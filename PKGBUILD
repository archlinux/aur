# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=pnpm-bin
pkgver=7.16.0
pkgrel=1
pkgdesc="Fast, disk space efficient package manager"
arch=("x86_64")
url="https://github.com/pnpm/pnpm"
license=("MIT License")
options=("!strip")
provides=("pnpm")
conflicts=("pnpm" "pnpm-git")
source=("pnpm-$pkgver::$url/releases/download/v${pkgver}/pnpm-linux-x64")
sha256sums=('1097f1afb837d25dfb9aad8bbb360c4eeb3a82863053f866c03896fc9abbb96d')

package() {
  install -D "$srcdir/pnpm-$pkgver" "$pkgdir/usr/bin/pnpm"
  chmod +x "$pkgdir/usr/bin/pnpm"
}

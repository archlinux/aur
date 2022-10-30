# Maintainer: Jonian Guveli <https://github.com/jonian/>
pkgname=pnpm-bin
pkgver=7.14.1
pkgrel=1
pkgdesc="Fast, disk space efficient package manager"
arch=("x86_64")
url="https://github.com/pnpm/pnpm"
license=("MIT License")
options=("!strip")
provides=("pnpm")
conflicts=("pnpm" "pnpm-git")
source=("pnpm-$pkgver::$url/releases/download/v${pkgver}/pnpm-linux-x64")
sha256sums=('b345eb8179e9ff678118c93f6c0a198575eb21f421c6708124613c0917877ade')

package() {
  install -D "$srcdir/pnpm-$pkgver" "$pkgdir/usr/bin/pnpm"
  chmod +x "$pkgdir/usr/bin/pnpm"
}

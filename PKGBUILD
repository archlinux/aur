# Maintainer: Jamie King <git@ironveil.cloud>

pkgname=ttf-aptos
pkgver=1.0
pkgrel=1
pkgdesc=" The (new) Aptos typeface for Microsoft 365."
arch=("any")
url="https://github.com/ironveil/github"
license=(unknown)
depends=(fontconfig)
makedepends=("git")
source=("git+https://github.com/ironveil/ttf-aptos.git")
md5sums=("SKIP")

package() {
  cd "$srcdir/ttf-aptos"

  install -d -m755 "$pkgdir/usr/share/fonts/aptos"
  install -D -m644 *.ttf "$pkgdir/usr/share/fonts/aptos"
}

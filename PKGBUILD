# Maintainer: Rasmus Rosengren <rasmus@rsrp.se>
pkgname=dfm
pkgver=0.2.0
pkgrel=1
pkgdesc="Utility for managing dotfiles"
arch=("x86_64")
url="https://github.com/rosengrenen/dfm"
license=("GPL3")
depends=("gcc-libs")
provides=("dfm")
conflicts=("dfm")
source_x86_64=("https://github.com/rosengrenen/dfm/releases/download/$pkgver/dfm-$pkgver-$CARCH.tar.gz")
sha256sums_x86_64=("34fa2340eab984be26032747d577ace794ef63c7d64d2046038aa1705159d457")

package() {
  install -Dm755 dfm -t "$pkgdir/usr/bin"
}

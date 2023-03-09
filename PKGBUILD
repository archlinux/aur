# Maintainer: Rasmus Rosengren <rasmus@rsrp.se>
pkgname=dfm
pkgver=0.2.1
pkgrel=1
pkgdesc="Utility for managing dotfiles"
arch=("x86_64")
url="https://github.com/rosengrenen/dfm"
license=("GPL3")
depends=("gcc-libs")
provides=("dfm")
conflicts=("dfm")
source_x86_64=("https://github.com/rosengrenen/dfm/releases/download/$pkgver/dfm-$pkgver-$CARCH.tar.gz")
sha256sums_x86_64=("d2cade06e42eb6f1154daf2d3131526f3117bbfc2e01c6be805538e10c7af2b4")

package() {
  install -Dm755 dfm -t "$pkgdir/usr/bin"
}

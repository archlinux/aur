# Maintainer: Rasmus Rosengren <rasmus@rsrp.se>
pkgname=dfm
pkgver=0.3.0
pkgrel=1
pkgdesc="Utility for managing dotfiles"
arch=("x86_64")
url="https://github.com/rosengrenen/dfm"
license=("GPL3")
depends=("gcc-libs" "difftastic")
provides=("dfm")
conflicts=("dfm")
source_x86_64=("https://github.com/rosengrenen/dfm/releases/download/$pkgver/dfm-$pkgver-$CARCH.tar.gz")
sha256sums_x86_64=("1085c690bd807dd185f6d7b86564a15810615b3b417ce2f3ada5e5542b8ae919")

package() {
  install -Dm755 dfm -t "$pkgdir/usr/bin"
}

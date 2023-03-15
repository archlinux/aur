# Maintainer: Rasmus Rosengren <rasmus@rsrp.se>
pkgname=dfm
pkgver=0.3.1
pkgrel=1
pkgdesc="Utility for managing dotfiles"
arch=("x86_64")
url="https://github.com/rosengrenen/dfm"
license=("GPL3")
depends=("gcc-libs" "difftastic")
provides=("dfm")
conflicts=("dfm")
source_x86_64=("https://github.com/rosengrenen/dfm/releases/download/$pkgver/dfm-$pkgver-$CARCH.tar.gz")
sha256sums_x86_64=("da21cbb90df7b2426c1b42be1e8cbfce8a469e7219e4badccc1da005a38dd8f3")

package() {
  install -Dm755 dfm -t "$pkgdir/usr/bin"
}

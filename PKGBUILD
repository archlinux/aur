pkgname=ttf-linek
pkgver=1
pkgrel=1
depends=(fontconfig xorg-font-utils)
pkgdesc="c-base Linear Construct font"
arch=(any)

source=("https://github.com/c-base/c-fonts/raw/master/linek_.ttf")
sha256sums=('afadd80b2399285b082075cb5a41679bbec9de28f1ed767f686608c73c1386c4')

install=$pkgname.install

package() {
  install -Dm644 "$srcdir/linek_.ttf" "$pkgdir/usr/share/fonts/TTF/linek_.ttf"
}

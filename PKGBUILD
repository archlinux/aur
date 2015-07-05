pkgname=ttf-ceva-c2
pkgver=2.0
pkgrel=1
depends=(fontconfig xorg-font-utils)
pkgdesc="c-base ceva font"
arch=(any)

source=("https://github.com/c-base/c-fonts/raw/master/ceva-c2.ttf")
sha256sums=('e8588911edc4154ef3923019fbf6a8da9b902ef05c8cc2dbdd61dcf310b4060c')

install=$pkgname.install

package() {
  install -Dm644 "$srcdir/ceva-c2.ttf" "$pkgdir/usr/share/fonts/TTF/ceva-c2.ttf"
}

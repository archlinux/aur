pkgname=ttf-ceva-cm
pkgver=1.0
pkgrel=1
depends=(fontconfig xorg-font-utils)
pkgdesc="c-base ceva font"
arch=(any)

source=("https://github.com/c-base/c-fonts/raw/master/ceva-cm.ttf")
sha256sums=('413c78f91bd39e134f3c0bb204b1d5a90f29df9efddc8fd26950a178058d5d74')

install=$pkgname.install

package() {
  install -Dm644 "$srcdir/ceva-cm.ttf" "$pkgdir/usr/share/fonts/TTF/ceva-cm.ttf"
}

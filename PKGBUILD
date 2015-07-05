pkgname=ttf-x-scale
pkgver=1
pkgrel=1
depends=(fontconfig xorg-font-utils)
pkgdesc="c-base x-scale font"
arch=(any)

source=("https://github.com/c-base/c-fonts/raw/master/x-scale.ttf")
sha256sums=('0835bc838c664d8cb2a5f12b4d353de1b1db032c2e4918f666f4673435e87c4d')

install=$pkgname.install

package() {
  install -Dm644 "$srcdir/x-scale.ttf" "$pkgdir/usr/share/fonts/TTF/x-scale.ttf"
}

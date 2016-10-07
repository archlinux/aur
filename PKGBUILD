pkgname=ttf-abkai
pkgver=1.0
pkgrel=2
pkgdesc="Abkai Xanyan TTF font for Manchu, Sibe and Daur scripts"
arch=(any)
depends=(fontconfig xorg-font-utils)
source=("Ab-Xy.ttf" )
url="http://abkai.net/core/en/"
license=('custom')
install=$pkgname.install
sha256sums=('SKIP')

package() {
  cd "${srcdir}"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF"
}

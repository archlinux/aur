# Maintainer: veyen <veyen33@gmail.com>

pkgname=ttf-abkai
pkgver=20150717
pkgrel=2
pkgdesc="Abkai Xanyan TTF font for Manchu, Sibe and Daur scripts"
arch=(any)
depends=(fontconfig xorg-font-utils)
source=("Ab-Xy.ttf" "LICENSE")
url="http://abkai.net/core/en/"
license=('custom')
install=$pkgname.install
sha256sums=('f0067f64d243f9a76e8010324f1d9fe5bb32d928f4d016856bacfdccb09aebfa' 'ee09d75f955eb8ab409e40ff9acacfe4cd717930658c96f206ceafb1610dcd9c')

package() {
  cd "${srcdir}"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 *.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

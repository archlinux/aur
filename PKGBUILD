# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>

pkgname=lato-fonts
pkgver=2.015
pkgrel=1
pkgdesc="Lato is a sanserif typeface family"
url="http://www.latofonts.com/"
arch=(any)
license=('custom:SIL')
source=("http://www.latofonts.com/download/Lato2OFL.zip")
sha256sums=('42b54e96c07e299d967fc3227c7bd63a20d6cfb1dc8fd6dae83628091e20a5b8')

package() {
  cd "${srcdir}/Lato2OFL"
  install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-fonts}" -m644 *.ttf
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

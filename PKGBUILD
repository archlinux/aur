pkgname=ttf-jomolhari
pkgver=1.0
pkgrel=1
pkgdesc="Dzongkha Font - Bhutanese style dbu-can OpenType font created by Christopher Fynn"
url=('http://www.library.gov.bt/IT/fonts.html')
arch=(any)
depends=(fontconfig xorg-font-utils)
source=("http://www.library.gov.bt/IT/download/Jomolhari.zip" "OFL.txt")
install=$pkgname.install
license=('custom:"OFL"')
md5sums=('ad29387227f65527208cb43b42961807'
         '6ed93967ff0dc6dd9c8d31c17f817a06')

package() {
#FONT
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 "$srcdir/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
#LICENSE
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 "$srcdir/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

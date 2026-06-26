# Maintainer: Sergio Ribera <sergioalejandroriberacosta@gmail.com>
pkgname=sss-noocr-bin
_pkgname=sss-noocr
pkgver=0.2.1
pkgrel=1
pkgdesc='Take pretty screenshots of your screen with annotations (no OCR)'
arch=('x86_64')
url='https://github.com/SergioRibera/sss'
license=('MIT')
depends=('glibc')

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://github.com/SergioRibera/sss/releases/download/sss_cli/v0.2.1/sss-noocr-bin-0.2.1-x86_64.tar.gz")
sha256sums=('1fd07a056cdc1d57369046ad351305dd4217e679498ba73fb565dd384cb2bfdf')


package() {
  cp -a "$srcdir/opt" "$pkgdir/"  2>/dev/null || true
  cp -a "$srcdir/usr" "$pkgdir/"  2>/dev/null || true
  cp -a "$srcdir/lib" "$pkgdir/"  2>/dev/null || true
}

# Maintainer: Brian Weasner <weasnerb at gmail dot com>

pkgname=ttf-material-design-icons-webfont
_pkgname=MaterialDesign-Webfont
pkgver=3.6.95
pkgrel=1
pkgdesc="Material Design webfont icons from materialdesignicons.com"
arch=('any')
url="https://materialdesignicons.com/"
license=('SIL OPEN FONT LICENSE Version 1.1')
depends=('fontconfig' 'xorg-font-utils')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Templarian/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3d613e075673552786f6fc7f3b381492ef6b22b11386e84bcbefb0971c0f18b1')

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 "$_pkgname-$pkgver/fonts/materialdesignicons-webfont.ttf" "$pkgdir/usr/share/fonts/TTF/materialdesignicons-webfont.ttf"
}

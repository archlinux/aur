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
sha256sums=('09b2aa5acbf58cfe469f64680dc3f3a9efd8987a4425a5d57fc847bf003bf847')

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 "$_pkgname-$pkgver/fonts/materialdesignicons-webfont.ttf" "$pkgdir/usr/share/fonts/TTF/materialdesignicons-webfont.ttf"
}

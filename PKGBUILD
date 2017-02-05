# Maintainer: Juraj Fiala <doctorjellyface AT riseup DOT net>
_srcname=cc-icons
pkgname=otf-cc-icons
pkgver=1.2.1
pkgrel=1
pkgdesc='Suite of pictographic Creative Commons icons'
arch=('any')
url="https://$_srcname.github.io/"
license=('MIT')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/$_srcname/$_srcname/archive/$pkgver.tar.gz")
md5sums=('8b4144d8d13dd6cb9b79518930e80705')

package() {
	cd "$_srcname-$pkgver/fonts"
  install -dm 755       "${pkgdir}/usr/share/fonts/OTF"
  install -m  644 *.otf "${pkgdir}/usr/share/fonts/OTF/"
}

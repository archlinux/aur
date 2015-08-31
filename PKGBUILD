# Maintainer:  Chris Top <mlw att pi dott xelpara dott de>

pkgname=ttf-geosans-light
pkgver=1.0
pkgrel=1
pkgdesc="Asian style font, clean and beautiful"
url=('http://www.dafont.com/geo-sans-light.font')
arch=('any')
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('unzip')
source=("${pkgname}.zip::http://img.dafont.com/dl/?f=geo_sans_light")
md5sums=('0ae169bc3c5998c0206bcc68f20c726a')
install=$pkgname.install

package() {
     install -d "$pkgdir/usr/share/fonts/TTF"
     cp -dpr --no-preserve=ownership "$srcdir/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
}

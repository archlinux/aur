# Maintainer: Aline Abler <alinea@riseup.net>

pkgname=ttf-conkyweather
pkgver=20170224.3f71158
pkgrel=1
pkgdesc='ConkyWeather font - weather icons'
url="https://github.com/altinukshini/conky_blue"
license=('GPL')
arch=('any')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=("git://github.com/altinukshini/conky_blue"
        'install')
install=install

package() {
	install -dm755 "${pkgdir}"/usr/share/fonts/TTF
	install -m644 conky_blue/fonts/conkyweather.ttf "${pkgdir}"/usr/share/fonts/TTF
}
md5sums=('SKIP'
         'b9b03309f730947d472a63b0e5ca3bb1')

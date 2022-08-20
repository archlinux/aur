# Maintainer: Roboron <robertoms258 at gmail dot com>
# Previous Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

pkgname=soundfont-realfont
pkgver=2.3
pkgrel=1
pkgdesc="GM soundbank by Michel Villeneuve."
arch=('any')
url="http://www.personalcopy.com/sfarkfonts1.htm"
license=("unknown")
groups=('soundfonts')
source=("https://files.michan.es/RealFont_${pkgver/./_}.SF2")
md5sums=('3e50819cc46497f0b5c9dc249b12294d')

package() {
  install -Dm644 "RealFont_${pkgver/./_}.SF2" "$pkgdir/usr/share/soundfonts/RealFont.sf2"
}

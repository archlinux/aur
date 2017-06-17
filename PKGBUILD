# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

pkgname=soundfont-realfont
pkgver=2.1
pkgrel=1
pkgdesc="GM soundbank by Michel Villeneuve."
arch=('any')
url="http://pages.videotron.com/mikev/realfont.htm"
license=("unknown")
groups=('soundfonts')
makedepends=('sfarkxtc')
source=("ftp://ftp.personalcopy.net/pub/RealFont_${pkgver/./_}.sfArk")
md5sums=('844ac271176de9fbb2180240d94c2701')

build() {
  sfarkxtc "RealFont_${pkgver/./_}.sfArk" "RealFont.sf2"
}

package() {
  install -Dm644 "RealFont.sf2" "$pkgdir/usr/share/soundfonts/RealFont.sf2"
}

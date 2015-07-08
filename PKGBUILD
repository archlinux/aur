# Maintainer: Aerion <emile [at] aerion [dot] co [uk]>

pkgname=otf-mathilde
pkgver=1.0
pkgrel=1
pkgdesc="Mathilde is a beautiful, free, handwritten cursive-hybrid OpenType font with contextual alternatives"
arch=('any')
url="http://leeviathan.com/portfolio-item/mathilde-free-handwritten-opentype-font/"
license=('CCPL:by-sa')
depends=('fontconfig' 'xorg-mkfontdir' 'xorg-mkfontscale')
install=otf.install
source=($pkgname.zip::http://img.dafont.com/dl/?f=mathilde)
md5sums=('3b293339eb59a418ee43a01bb69306ca')

build() {
  # nothing to do
  true
}

package() {
  install -d ${pkgdir}/usr/share/fonts/OTF/
  install -Dm644 ${srcdir}/mathilde.otf ${pkgdir}/usr/share/fonts/OTF/mathilde.otf
}

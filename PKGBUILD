# Maintainer: Mills00013 < Mills00013@gmail.com >
# Font author: Caffeinebasedlifeform

pkgname=bdf-boxxy
pkgver=0.1
pkgrel=1
pkgdesc="Terminal friendly bdf font by caffeinebasedlifeform"
arch=('i686' 'x86_64')
license=('custom' 'GPL2')
url="https://github.com/Tecate/bitmap-fonts/tree/master/bitmap/boxxy"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=bdf-boxxy.install
source=('boxxy.bdf::https://raw.githubusercontent.com/Tecate/bitmap-fonts/master/bitmap/boxxy/boxxy.bdf' 'boxxy-bold.bdf::https://raw.githubusercontent.com/Tecate/bitmap-fonts/master/bitmap/boxxy/boxxy-bold.bdf')
md5sums=('979994a1b1c68496c7a5604ed25e19fd' '56e7b9698834f051b6ab2343ee16868d')

package() {
  install -Dm644 ${srcdir}/boxxy.bdf \
	${pkgdir}/usr/share/fonts/misc/boxxy.bdf
  install -Dm644 ${srcdir}/boxxy-bold.bdf \
	${pkgdir}/usr/share/fonts/misc/boxxy-bold.bdf

}

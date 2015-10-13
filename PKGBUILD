# Maintainer: Tom <reztho at archlinux dot org>
# Contribuitor: Eric Bélanger <eric@archlinux.org>

pkgname=soundfont-sgm
pkgver=2.01
pkgrel=1
pkgdesc="A balanced, good quality GM soundbank"
arch=('any')
url="http://www.geocities.jp/shansoundfont/"
license=('custom')
groups=('soundfonts')
source=(http://sourceforge.net/projects/androidframe/files/soundfonts/SGM-V2.01.sf2 license.txt)
sha1sums=('5f18381d80d98c88786e802d1170c8ec009b6f24'
          '8b5a74b28c1029e5ba5e45bf5c8830922b3705e2')

package() {
   install -D -m644 SGM-V2.01.sf2 "${pkgdir}/usr/share/soundfonts/SGM-V2.01.sf2"
   install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

# Maintainer: FFY00 <filipe.lains@gmail.com>
# Contributor: Jinho Jeong <jjinho0203@gmail.com>
pkgname=ttf-d2coding
pkgver=1.3.1
_pkgver="Ver$pkgver-20180115"
pkgrel=1
pkgdesc="D2Coding Fixed Width TrueType fonts"
arch=('any')
url="http://dev.naver.com/projects/d2coding"
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
provides=('ttf-font' 'ttf-d2coding')
conflicts=('ttf-d2coding')
install=ttf.install
source=("https://github.com/naver/d2codingfont/releases/download/VER$pkgver/D2Coding-$_pkgver.zip")
md5sums=('97fae9dac56c3b6123b46f93456ede92')

package() {
  install -dm 755 "$pkgdir"/usr/share/fonts/TTF
  install -Dm 644 "$srcdir"/D2Coding-$_pkgver/D2Coding/D2Coding-$_pkgver.ttc "$pkgdir"/usr/share/fonts/TTF/D2Coding.ttc
  install -Dm 644 "$srcdir"/D2Coding-$_pkgver/D2CodingLigature/D2Coding-$_pkgver-ligature.ttc "$pkgdir"/usr/share/fonts/TTF/D2CodingLigature.ttc
}


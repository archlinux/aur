# Maintainer: FFY00 <filipe.lains@gmail.com>
# Contributor: Jinho Jeong <jjinho0203@gmail.com>
pkgname=ttf-d2coding
pkgver=1.3.1
_pkgver="Ver$pkgver-20180115"
pkgrel=1
pkgdesc="D2Coding Fixed Width TrueType fonts"
arch=('any')
url="https://github.com/naver/d2codingfont"
license=('custom:OFL')
depends=('xorg-font-utils')
provides=('ttf-font')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/VER$pkgver/D2Coding-$_pkgver.zip"
	"$pkgname-LICENSE")
sha256sums=('06f3fdb7a5a02e695af47ae95bd246713745e191628fd9a1bea670a67528b82c'
	    'be57b5523df5df8a36eefb663e004e368c30cc2c2a1ee947a4f91114c7dc0a26')

package() {
  install -dm 755 "$pkgdir"/usr/share/fonts/TTF
  install -Dm 644 "$srcdir"/D2Coding-$_pkgver/D2Coding/D2Coding-$_pkgver.ttc "$pkgdir"/usr/share/fonts/TTF/D2Coding.ttc
  install -Dm 644 "$srcdir"/D2Coding-$_pkgver/D2CodingLigature/D2Coding-$_pkgver-ligature.ttc "$pkgdir"/usr/share/fonts/TTF/D2CodingLigature.ttc

  install -dm 644 "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm 644 "$srcdir"/$pkgname-LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


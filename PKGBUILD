# Maintainer: Alexis Janon <kardyne -at- gmail -dot- com>
# Contributor: FFY00 <filipe.lains@gmail.com>
# Contributor: Jinho Jeong <jjinho0203@gmail.com>
pkgname=ttf-d2coding
pkgver=1.3.2
_pkgver="Ver$pkgver-20180524"
pkgrel=2
pkgdesc="D2Coding Fixed Width TrueType fonts"
arch=('any')
url='https://github.com/naver/d2codingfont'
license=('custom:OFL')
provides=('ttf-font')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/VER$pkgver/D2Coding-$_pkgver.zip"
        "$pkgname-LICENSE")
sha512sums=('78ef10cc836ff57b889507249bacfe8e73273697ffd097f7841143204009ca30b7aff259145e93b02e836164c84c005fd20352758dc25e1a058715f6d7f9b8a2'
            'd8d2a3613d540f9ed3a8b9f238217fdb3ae5724248c527a18625d8b962ba0de512803757c65e5fdd1d5441ac5d3bd72a4413408a4be972c622815b6fa0d0998d')

package() {
  install -Dm 644 D2Coding/D2Coding-$_pkgver.ttc "$pkgdir"/usr/share/fonts/TTF/D2Coding.ttc
  install -Dm 644 D2CodingLigature/D2Coding-$_pkgver-ligature.ttc "$pkgdir"/usr/share/fonts/TTF/D2CodingLigature.ttc

  install -Dm 644 $pkgname-LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


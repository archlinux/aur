# Maintainer: eclairevoyant
_fontname=NomNaTong-Regular.ttf
pkgname=ttf-nomnatong
pkgver=5.04
pkgrel=1
pkgdesc="The Hán-Nôm Coded Character Set and Nom Na Tong Regular Reference Font"
arch=('any')
url="http://www.nomfoundation.org/nom-tools/Nom-Font"
license=('MIT')
_ghprefix='https://github.com/nomfoundation/font'
source=("$pkgname-$pkgver.ttf::$_ghprefix/releases/download/v$pkgver/$_fontname"
        "$pkgname-$pkgver-LICENSE::$_ghprefix/raw/master/LICENSE")
sha256sums=('e964ad9de32c1d0f0820936cb1304c94c3ffe4a2132d024b738218f2499b11c8'
            '5a96128ab441fd6df1ca8aa48a7223dfa3c4bd2c001262712373698bb24e8e72')

package() {
  install -Dm644 $pkgname-$pkgver.ttf "$pkgdir/usr/share/fonts/TTF/$_fontname"
  install -Dm444 $pkgname-$pkgver-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

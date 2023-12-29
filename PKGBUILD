# Maintainer: eclairevoyant

_fontname=NomNaTong-Regular.ttf
pkgname=ttf-nomnatong
pkgver=5.08
pkgrel=1
pkgdesc="The Hán-Nôm Coded Character Set and Nom Na Tong Regular Reference Font"
arch=(any)
url="http://www.nomfoundation.org/nom-tools/Nom-Font"
license=(MIT)
_ghprefix='https://github.com/nomfoundation/font'
source=("$pkgname-$pkgver.ttf::$_ghprefix/releases/download/v$pkgver/$_fontname"
        "$pkgname-$pkgver-LICENSE::$_ghprefix/raw/master/LICENSE")
b2sums=('6c7e694a228dc95e361f96e3c2338b4a3ad64af46a31ed3782595c5ce450a91b174739f788a39d3b9ca1a87cf6f2c11721082d4673a46cb7738db01e4c8d2e29'
        '802c1065236acacfe17f0bcbe53f0e46e4e51c15cd22adf7d76e9dbf99a2ac67e8d898a6c8a45d14f404a8bbe29e5f28c48d2fded79f090bae40de68c71fbfc3')

package() {
	install -vDm644 $pkgname-$pkgver.ttf "$pkgdir/usr/share/fonts/TTF/$_fontname"
	install -vDm444 $pkgname-$pkgver-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

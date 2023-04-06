# Maintainer: eclairevoyant

_fontname=NomNaTong-Regular.ttf
pkgname=ttf-nomnatong
pkgver=5.05
pkgrel=1
pkgdesc="The Hán-Nôm Coded Character Set and Nom Na Tong Regular Reference Font"
arch=(any)
url="http://www.nomfoundation.org/nom-tools/Nom-Font"
license=(MIT)
_ghprefix='https://github.com/nomfoundation/font'
source=("$pkgname-$pkgver.ttf::$_ghprefix/releases/download/v$pkgver/$_fontname"
        "$pkgname-$pkgver-LICENSE::$_ghprefix/raw/master/LICENSE")
b2sums=('8d09ed99ef6cc5e7f6ad68989bcf2031b1c3c851f5b4bdb7ccfdcb7a0e9924480b00fa9eca7d115f6d874769d75083c5e862c7967eda07583afdd70699de74aa'
        '802c1065236acacfe17f0bcbe53f0e46e4e51c15cd22adf7d76e9dbf99a2ac67e8d898a6c8a45d14f404a8bbe29e5f28c48d2fded79f090bae40de68c71fbfc3')

package() {
	install -Dm644 $pkgname-$pkgver.ttf "$pkgdir/usr/share/fonts/TTF/$_fontname"
	install -Dm444 $pkgname-$pkgver-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

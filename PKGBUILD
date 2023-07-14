# Maintainer: eclairevoyant

_fontname=NomNaTong-Regular.ttf
pkgname=ttf-nomnatong
pkgver=5.06
pkgrel=1
pkgdesc="The Hán-Nôm Coded Character Set and Nom Na Tong Regular Reference Font"
arch=(any)
url="http://www.nomfoundation.org/nom-tools/Nom-Font"
license=(MIT)
_ghprefix='https://github.com/nomfoundation/font'
source=("$pkgname-$pkgver.ttf::$_ghprefix/releases/download/v$pkgver/$_fontname"
        "$pkgname-$pkgver-LICENSE::$_ghprefix/raw/master/LICENSE")
b2sums=('333f09fbd77a94f1b571735214073127afb4e60b64d663f1809142566b3250707bf5e691ea0d10495a57336ef7d2a8b2a58b7d6255d686171d618f901c96879e'
        '802c1065236acacfe17f0bcbe53f0e46e4e51c15cd22adf7d76e9dbf99a2ac67e8d898a6c8a45d14f404a8bbe29e5f28c48d2fded79f090bae40de68c71fbfc3')

package() {
	install -vDm644 $pkgname-$pkgver.ttf "$pkgdir/usr/share/fonts/TTF/$_fontname"
	install -vDm444 $pkgname-$pkgver-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

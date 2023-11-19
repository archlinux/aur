# Maintainer: eclairevoyant

_fontname=NomNaTong-Regular.ttf
pkgname=ttf-nomnatong
pkgver=5.07
pkgrel=1
pkgdesc="The Hán-Nôm Coded Character Set and Nom Na Tong Regular Reference Font"
arch=(any)
url="http://www.nomfoundation.org/nom-tools/Nom-Font"
license=(MIT)
_ghprefix='https://github.com/nomfoundation/font'
source=("$pkgname-$pkgver.ttf::$_ghprefix/releases/download/v$pkgver/$_fontname"
        "$pkgname-$pkgver-LICENSE::$_ghprefix/raw/master/LICENSE")
b2sums=('3b960f25d8901bd51a0783bee335f9d93956f9e91139785a973abda351a7390e73db83448b69fa8f257b82aa4475dd8dcbcc9273c647f25c831b6599c4f02083'
        '802c1065236acacfe17f0bcbe53f0e46e4e51c15cd22adf7d76e9dbf99a2ac67e8d898a6c8a45d14f404a8bbe29e5f28c48d2fded79f090bae40de68c71fbfc3')

package() {
	install -vDm644 $pkgname-$pkgver.ttf "$pkgdir/usr/share/fonts/TTF/$_fontname"
	install -vDm444 $pkgname-$pkgver-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

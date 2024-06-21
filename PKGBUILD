# Maintainer: Jax Young <jaxvanyang@gmail.com>
pkgbase='comic-shanns-nerd'
pkgname=({otf,ttf}-"$pkgbase")
pkgver=2.1.0
pkgrel=1
pkgdesc="Nerd font version of Comic Shanns"
arch=(any)
provides=("$pkgbase")
conflicts=("$pkgbase")
url="https://github.com/jaxvanyang/$pkgbase"
license=('MIT')
_font_name='ComicShannsNerdFont-Regular'
# avoid file name conflict
source=(
	"$_font_name-v$pkgver.otf::$url/releases/download/v$pkgver/$_font_name.otf"
	"$_font_name-v$pkgver.ttf::$url/releases/download/v$pkgver/$_font_name.ttf"
	"$pkgbase-$pkgver.LICENSE::$url/raw/v$pkgver/LICENSE"
)
sha256sums=('a212e28abdca7afd2a47d91431e072ccd0e2b1f786cbf025d24438454e24f5a8'
	'f043fbbfefb4af3ba2aa341d2d550b730d9c81cfd0826aca889d3a60a76708ef'
	'97613451616be37592e731fb14ee99749516fd360bd360bcd2d39b66d4931d0b')

package_otf-comic-shanns-nerd() {
	pkgdesc+=' (OTF)'

	install -Dm644 "$_font_name-v$pkgver.otf" "$pkgdir/usr/share/fonts/OTF/$_font_name.otf"
	install -Dm644 "$pkgbase-$pkgver.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_ttf-comic-shanns-nerd() {
	pkgdesc+=' (TTF)'

	install -Dm644 "$_font_name-v$pkgver.ttf" "$pkgdir/usr/share/fonts/OTF/$_font_name.ttf"
	install -Dm644 "$pkgbase-$pkgver.LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

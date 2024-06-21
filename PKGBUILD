# Maintainer: Jax Young <jaxvanyang@gmail.com>
pkgbase='comic-shanns-nerd'
pkgname=({otf,ttf}-"$pkgbase")
pkgver=2.0.0
pkgrel=1
pkgdesc="Nerd font version of Comic Shanns"
arch=(any)
provides=("$pkgbase")
conflicts=("$pkgbase")
url="https://github.com/jaxvanyang/$pkgbase"
license=('MIT')
source=(
	"$url/releases/download/v$pkgver/ComicShannsNerdFont-Regular.otf"
	"$url/releases/download/v$pkgver/ComicShannsNerdFont-Regular.ttf"
	"$url/raw/v$pkgver/LICENSE"
)
sha256sums=('d2c2ca944cb21ed9f7d8cddd912f0c859931e7865d589324708a323a2a68cf88'
	'585ca7606c559a74a0199e3034ae4843540983c8d8dbb6394c5dd530ea8569e6'
	'6a8855512749568a12153c13b328bb1b8d1eefb89e7b997777667c988db11055')

package_otf-comic-shanns-nerd() {
	pkgdesc+=' (OTF)'

	install -Dm644 -t "$pkgdir/usr/share/fonts/OTF" ComicShannsNerdFont-Regular.otf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

package_ttf-comic-shanns-nerd() {
	pkgdesc+=' (TTF)'

	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" ComicShannsNerdFont-Regular.ttf
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

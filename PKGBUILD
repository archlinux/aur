# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
_pkgname=ttf-patrick-hand
pkgname="$_pkgname"-full
pkgver=2.001
pkgrel=2
pkgdesc='font based on Patrick Wagesreiter’s handwriting'
arch=(any)
url="https://fonts.google.com/specimen/Patrick+Hand"
license=(OFL)
source=("$_pkgname-$pkgver.zip::https://fonts.google.com/download?family=Patrick+Hand"
        "$_pkgname-SC-$pkgver.zip::https://fonts.google.com/download?family=Patrick+Hand+SC")
sha256sums=('c29ef217da8d26b44290f2320820f432311083cf922f8c6219abbdcec2a41af1'
            '67a52e8f10b756720380fff246e7dab8532c970423ee330d075923b26cff093d')

package() {
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt
	install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" *.ttf
}

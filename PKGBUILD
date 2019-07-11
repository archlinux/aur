# Maintainer: Shaarad Dalvi <dalvishaarad at gmail dot com>
pkgname=habash
pkgver=1.0.0
pkgrel=1
pkgdesc="A (very minimal) habitica terminal client written entirely in bash."
arch=('any')
url="https://github.com/nasfarley88/habash"
license=('custom:cc0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
noextract=()
sha512sums=('26426d3e541cbd62773f9e00bcdeeb777bb840f79efc29e61bb181c31292ff9357b8473a2b95652c0afb298700ddd33ac065af81861e325c3a41fe72888c97a5')
validpgpkeys=()

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 habash "$pkgdir"/usr/bin/habash
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	mkdir -p "$pkgdir"/usr/share/doc/$pkgname/
	cp -r examples "$pkgdir"/usr/share/doc/$pkgname/
}

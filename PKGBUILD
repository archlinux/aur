# Maintainer: tee < teeaur at duck dot com >
_pkgname=javy
pkgname=javy-bin
pkgver=9.1.0
pkgrel=1
pkgdesc="A JavaScript to Webassembly toolchain"
arch=(x86_64)
url="https://github.com/bytecodealliance/javy"
license=(Apache-2.0)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/raw/v$pkgver/LICENSE.md"
		"$url/releases/download/v$pkgver/$_pkgname-$arch-linux-v$pkgver.gz.sha256")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$arch-linux-v$pkgver.gz")
sha256sums=('SKIP'
            'SKIP')
sha256sums_x86_64=('a68b122d48eb3dfc1b801d4e14c39271fde3638243d3272d206e376ac9189e39')

package() {
	install -Dm755 "$_pkgname-$arch-linux-v$pkgver" "$pkgdir/usr/bin/${_pkgname}"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE.md"
}

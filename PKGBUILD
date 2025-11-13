# Maintainer: tee < teeaur at duck dot com >
_pkgname=javy
pkgname=javy-bin
pkgver=8.0.0
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
sha256sums=('3b26cd02b9d9bf324bce59edd88c02cb93fa9a908528b805264db8cde53295e6'
            'ebd26af0a993bd13df57559ec74fb574788c12940b058304ccbb7a0c7de7bc71')
sha256sums_x86_64=('2a1e16eff42a5a90f5fb9fcd03a9e61b4eeb2518bfe1bc399196afe46e60ac86')

package() {
	cd "${srcdir}"
	install -Dm755 "$_pkgname-$arch-linux-v$pkgver" "$pkgdir/usr/bin/${_pkgname}"
	install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE.md"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:

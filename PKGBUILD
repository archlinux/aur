# Maintainer: tee < teeaur at duck dot com >
_pkgname=javy
pkgname=javy-bin
pkgver=7.0.1
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
            'be2e318c8188dbf656a5ee9f6700de14bf31075b6a209089adbb0583d53fbed7')
sha256sums_x86_64=('361cc2375077380cda6e002545cfa831f2b47302becec0baebf54254831f7b9e')

package() {
	cd "${srcdir}"
	install -Dm755 "$_pkgname-$arch-linux-v$pkgver" "$pkgdir/usr/bin/${_pkgname}"
	install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE.md"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:

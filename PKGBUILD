# Maintainer: tee < teeaur at duck dot com >
_pkgname=javy
pkgname=javy-bin
pkgver=8.1.0
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
            '50a263371779368b04601793b8f8969e56aff37c819d6e43b322a8e97f895d97')
sha256sums_x86_64=('043374b46076cd4408182c02a6f1b9e255806689f5b4b19a446734be0f7c7a6d')

package() {
	install -Dm755 "$_pkgname-$arch-linux-v$pkgver" "$pkgdir/usr/bin/${_pkgname}"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE.md"
}

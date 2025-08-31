# Maintainer: tee < teeaur at duck dot com >
_pkgname=javy
pkgname=javy-bin
pkgver=6.0.0
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
            'defd5f87d5474ee9558730e33f5efb2471d27b41251f521cf32716fd107d5804')
sha256sums_x86_64=('3b655d3710797fecb07c41b5ed3f84705c1fd0ec7d1ed856ffc582fc63d3ddf1')

package() {
	cd "${srcdir}"
	install -Dm755 "$_pkgname-$arch-linux-v$pkgver" "$pkgdir/usr/bin/${_pkgname}"
	install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE.md"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:

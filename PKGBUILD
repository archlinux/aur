# Maintainer: tee < teeaur at duck dot com >
_pkg=focus
pkgname=focus-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='A simple and fast text editor'
arch=(x86_64)
url="https://github.com/focus-editor/focus"
license=('GPL-3.0')
provides=('focus')
conflicts=('focus')
source=("LICENSE-$pkgver::$url/raw/$pkgver/LICENSE")
source_x86_64=("$_pkg-$pkgver::$url/releases/download/$pkgver/focus-linux")
sha256sums=('8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b')
sha256sums_x86_64=('a0ff79f21999e26d072299f8d81d8dd45446f5f3901a3cfd4cd444c01a4e1107')

package() {
	install -Dm0755 "$_pkg-$pkgver" "$pkgdir/usr/bin/$_pkg"
	install -Dm644 "LICENSE-$pkgver" -t "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:

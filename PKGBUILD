# Maintainer: tee < teeaur at duck dot com >
_pkg=focus
pkgname=focus-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='A simple and fast text editor'
arch=(x86_64)
url="https://github.com/focus-editor/focus"
license=('GPL-3.0')
provides=('focus')
conflicts=('focus')
source=("focus.desktop"
		"$url/raw/$pkgver/LICENSE"
		"$url/raw/$pkgver/images/focus.png")
source_x86_64=("$_pkg-$pkgver::$url/releases/download/$pkgver/focus-linux")
b2sums=('62297f30c35be5f9f82fa24c876f924c3838e8249fd4f1c120b3d4e89b09287d763e75529676b87fbd54c53611f3e67562a65f9639fe74de14a8d56c72f22465'
        'f227f1b2d224a77b18fc96417ff23afc9db8f47894cb4e7c5cf107b795117426fc24db9c24cd7764f0af5092ec11c101843ad7cd4aad08ed3dcf5b541b63bdf6'
        'd3b689130762002b41ba928b68af5014198fbb63df0fcbc517c30cdfadb3dfafaee46c30a7cc2eda97f198c2fc4df0810d7993e627155ddd7635b19754fecc6d')
b2sums_x86_64=('04d47500db9974ce24a425b14c6fe82f43c61de3fce8c8b37ccd81e2e8642326121474e5185a446a1ba5038982ace8ebcd70f63ee30984a1c21c0b9e58121191')

package() {
	install -Dm0755 "$_pkg-$pkgver" "$pkgdir/usr/bin/$_pkg"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 focus.desktop "$pkgdir"/usr/share/applications/focus.desktop
	install -Dm755 focus.png "$pkgdir"/usr/share/pixmaps/focus.svg
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:

# Maintainer: tee < teeaur at duck dot com >
_pkg=focus
pkgname=focus-bin
pkgver=0.3.1
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
b2sums_x86_64=('da3d4794a5275bc8c0d0e073a9f1009ec07ac5e46f55d304478012ac67c329dd43525ec67e25711aa7ec72953bf6dcec299cd6fe4895430d34a0f00da4b67ac5')

package() {
	install -Dm0755 "$_pkg-$pkgver" "$pkgdir/usr/bin/$_pkg"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 focus.desktop -t "$pkgdir"/usr/share/applications/
	install -Dm755 focus.png -t "$pkgdir"/usr/share/pixmaps/
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:

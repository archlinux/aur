# Maintainer: Loic Meunier <LoicDotMeunierAtPosteoDotNet>
pkgname=ttf-courier-code
pkgver=1
pkgrel=1
pkgdesc="Bold like the typewriter original, adapted for code."
arch=('any')
url="https://fontain.org/courier-code/"
license=('custom:Bitstream Vera')
source=('https://fontain.org/courier-code/export/ttf/courier-code.ttf.zip')
sha256sums=(4e08b8c5e9a703230e31c3e15c1b17a668f7e3788320b545bfca91b23bd9f593)

package() {
	cd "$srcdir"
	install -d "$pkgdir/usr/share/fonts/courier-code"
	install -m644 courier-code*.ttf "$pkgdir/usr/share/fonts/courier-code"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Louis Tim Larsen <louis(a)louis.dk>

pkgname=ttf-dnk
pkgver=1
pkgrel=1
pkgdesc="Damn Noisy Kids Font"
arch=(any)
url="http://www.dafont.com/damn-noisy-kids.font"
license=('custom')
depends=('fontconfig')
source=("dnk.zip::http://dl.dafont.com/dl/?f=damn_noisy_kids")
sha512sums=('76c60d1268311fcfe2e2b7f3b59278391eb1b1b6e16667ed717e8f50ba2bca27da8d4cbfa6b0c319453675c42dfe17e5a97b81eca02994d21786cbdcda2e126e')

package() {
	install -Dm644 "$srcdir/dnk.ttf" -t "$pkgdir/usr/share/fonts/TTF/"
	install -Dm644 "$srcdir/font info.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


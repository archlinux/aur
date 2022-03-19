# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: feufochmar <feufochmar.gd@gmail.com>

pkgname=ttf-nova
pkgver=3.0.0
pkgrel=1
epoch=1
pkgdesc="Sans-serif font family originally created for stone inscriptions"
arch=('any')
url="https://fontlibrary.org/font/nova"
license=('custom:OFL')
source=("$pkgname-$pkgver.zip::https://fontlibrary.org/assets/downloads/nova/0e76fd6f2f8dd7ea67b44c52de3b775d/nova.zip")
sha256sums=('21ec68caaaaf588851070a94567c824e4b22085dfbf3d7fc4582c2e0f0489751')

package() {
	cd Nova
	install -Dm644 "SIL - Open Font License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 *.ttf -t "$pkgdir/usr/share/fonts/TTF/"
}

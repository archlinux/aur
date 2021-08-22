# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Marcos Heredia <chelqo@gmail.com>

pkgname=ttf-impallari-milonga
pkgver=1.0
pkgrel=2
pkgdesc='A serif font inspired on "tangueros" art, from Pablo Impallari'
arch=('any')
url='https://fonts.google.com/specimen/Milonga/'
license=('custom:OFL')
groups=('impallari-fonts')
provides=('ttf-font')
source=("$pkgname-$pkgver.zip::https://fonts.google.com/download?family=Milonga")
sha256sums=('47b2bea6498dde55c310de26537362176a5387a921e5a2ccb9f1bcf926c1ee7e')

package() {
	install -Dm 644 *.ttf -t "$pkgdir/usr/share/fonts/TTF/"
	install -Dm 644 OFL.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# Maintainer: Gerome Matilla <gerome.matilla07@gmail.com | gmail>

pkgname=lightdm-webkit2-theme-glorious
pkgver=2.0.5
pkgrel=3
pkgdesc="A sleek, modern and glorified LightDM webkit2 theme"
arch=('any')
url="https://github.com/manilarome/$pkgname"
license=('GPL3')
depends=('lightdm-webkit2-greeter')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('bd3831886cffbcbd17a4ae88787485075e7f6bda4bda94ff7883f1257b03caff28ec36d3833a4a45f5401a77f5c3cd84f3209307e8aa6cca313e4824189ad41f')

package() {
	install -dm 755 "$pkgdir"/usr/share/lightdm-webkit/themes/glorious
	cp -r --no-preserve=ownership * "$pkgdir"/usr/share/lightdm-webkit/themes/glorious/

	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

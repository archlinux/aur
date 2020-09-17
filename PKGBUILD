# Maintainer: Gerome Matilla <gerome.matilla07@gmail.com | gmail>

pkgname=lightdm-webkit2-theme-glorious
pkgver=2.0.4
pkgrel=2
pkgdesc="A sleek, modern and glorified LightDM webkit2 theme"
arch=('any')
url="https://github.com/manilarome/$pkgname"
license=('GPL3')
depends=('lightdm-webkit2-greeter')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c081ab01a87dcaf887114d0bc61c71ca8e5957034e2239baf650f0e7f7da602c055e8637aeba578362c9e2c97e9c0b7c9a1c2f6457e5398877ab22db676e66c3')

package() {
	install -dm 755 "$pkgdir"/usr/share/lightdm-webkit/themes/glorious
	cp -r --no-preserve=ownership * "$pkgdir"/usr/share/lightdm-webkit/themes/glorious/

	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

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
sha512sums=('a36d945120d664e793e9f3e3cdd84db84bb2b1824349c1a71aaba83a39a57050c4e1bfa0ecf2b24fc4602dabe8a3c36e118c3ca805c5daa5f9355ec500579a10')

package() {
	install -dm 755 "$pkgdir"/usr/share/lightdm-webkit/themes/glorious
	cp -r --no-preserve=ownership * "$pkgdir"/usr/share/lightdm-webkit/themes/glorious/

	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

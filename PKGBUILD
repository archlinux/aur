# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=dollar
pkgver=2
pkgrel=1
pkgdesc="Omit the $ from commands"
arch=('any')
url="https://github.com/editicalu/dollar"
source=("https://github.com/editicalu/$pkgname/archive/$pkgver.tar.gz")
sha512sums=("7d61f7daa957a281b01fc3cd3dfa0beba00b02240d004005c627af89e6dd137082eec5087a66a089b077809ec4f03558ed539a6485cf82d664204b96909af47c")

license=('custom:unlicense')
conflicts=('dollar-sign')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$.sh" "$pkgdir/usr/bin/$"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

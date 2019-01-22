# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=dollar
pkgver=1
pkgrel=1
pkgdesc="Omit the $ from commands"
arch=('any')
url="https://github.com/editicalu/dollar"
source=("https://github.com/editicalu/$pkgname/archive/$pkgver.tar.gz")
sha512sums=("55f1566297afa0edcda3116ab4752eaa2e74f43bf9e3ef1f4650a9aa6c76e08d7e71bbf24e05da607c81b8a5b6bb2b4d9263303974cad87bc5070438d3756bae")

license=('custom:unlicense')
conflicts=('dollar-sign')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$.sh" "$pkgdir/usr/bin/$"
}

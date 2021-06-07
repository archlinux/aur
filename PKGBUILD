# Maintainer: Ward Segers <w@rdsegers.be>

pkgname=dollar
pkgver=3
pkgrel=1
pkgdesc="Omit the $ from commands"
arch=('any')
url="https://github.com/editicalu/dollar"
source=("https://github.com/editicalu/$pkgname/archive/$pkgver.tar.gz")
sha512sums=("17cca26c01b22d064a999c89a43b65d22eafbcfa575ac5e57195b7fba8de9d88ca713fdd186fdb61c3214fa006c63f8d7b4edde17ab06baa4a6b184b4e9720db")

license=('custom:unlicense')
conflicts=('dollar-sign')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$.sh" "$pkgdir/usr/bin/$"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

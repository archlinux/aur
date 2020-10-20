# Maintainer: Gerome Matilla <gerome.matilla07@gmail.com | gmail>

pkgname=plymouth-theme-arch10
pkgver=1
pkgrel=1
pkgdesc="Windows10-like Archlinux boot splash theme for Plymouth"
arch=('any')
url="https://github.com/manilarome/$pkgname"
license=('GPL2')
depends=('plymouth')
install="${pkgname}.install"
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('27da8d82b730736cd37d7591b029ddb302e80855f6791e65fffeae3f5cfd6363986dbe8b3b447a72bdd57869bbf94e253e45f008e4d3139f01aa456634f08740')

package() {
	install -dm 755 "$pkgdir"/usr/share/plymouth/themes/arch10/
	cp -r --no-preserve=ownership * "$pkgdir"/usr/share/plymouth/themes/arch10/

	install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

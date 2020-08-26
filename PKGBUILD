# Maintainer: JohnGavr <gavriilidsg@tutanota.com>
pkgname=ytd101
pkgver=1.0
pkgrel=1
pkgdesc="A youtube download script in Bash"
arch=( 'any' )
url="https://github.com/JohnGavr/ytd101"
license=('MIT')
depends=('youtube-dl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JohnGavr/ytd101/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 ytd "$pkgdir/usr/bin/ytd"
}

# Maintainer: JohnGavr <gavriilidsg@tutanota.com>
pkgname=ytd101
pkgver=1.1
pkgrel=1
pkgdesc="A youtube download script."
arch=( 'any' )
url="https://github.com/JohnGavr/ytd101"
license=('MIT')
depends=(
	'youtube-dl'
	'atomicparsley'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/JohnGavr/ytd101/archive/v${pkgver}.tar.gz")
md5sums=('74eae092f7056bdd46aba48ae3231398')

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 ytd.sh "$pkgdir/usr/bin/ytd"
}


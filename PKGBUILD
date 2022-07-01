# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=dprint-bin
pkgver=0.30.0
pkgrel=1
pkgdesc='Pluggable and configurable code formatting platform'
arch=('x86_64')
url='https://github.com/dprint/dprint'
license=('MIT')
depends=('gcc-libs')
provides=('dprint')
conflicts=('dprint')
source=("$pkgname-$pkgver.zip::$url/releases/download/$pkgver/dprint-x86_64-unknown-linux-gnu.zip"
        'LICENSE')
sha256sums=('8ca8c0d834f8e7c6f7be10c32e1c54fd99067997b0a15f22f598ad492029abb9'
            '43f8cfbeca17eccd83fc98f27d211073eaee5574fc3162f345acc196d6190ce7')

package() {
	install -D dprint -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=dprint-bin
pkgver=0.24.4
pkgrel=1
pkgdesc='Pluggable and configurable code formatting platform written in Rust.'
arch=('x86_64')
url='https://github.com/dprint/dprint'
license=('MIT')
depends=('gcc-libs')
provides=('dprint')
conflicts=('dprint')
source=("$pkgname-$pkgver.zip::$url/releases/download/$pkgver/dprint-x86_64-unknown-linux-gnu.zip"
        'LICENSE')
sha256sums=('1abbc9940b998793d3269f9f40d86d69aa78a7c62664f2889a1c3aba560049dc'
            '43f8cfbeca17eccd83fc98f27d211073eaee5574fc3162f345acc196d6190ce7')

package() {
	install -D dprint -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

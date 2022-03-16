# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=dprint-bin
pkgver=0.23.1
pkgrel=3
pkgdesc='Pluggable and configurable code formatting platform written in Rust.'
arch=('x86_64')
url='https://github.com/dprint/dprint'
license=('MIT')
depends=('gcc-libs')
provides=('dprint')
conflicts=('dprint')
source=("$pkgname-$pkgver.zip::$url/releases/download/$pkgver/dprint-x86_64-unknown-linux-gnu.zip"
        'LICENSE')
sha256sums=('c57923a76ce8b5b134371f337db437a59b4ea5a86875c55339d366ad409bfd2a'
            '43f8cfbeca17eccd83fc98f27d211073eaee5574fc3162f345acc196d6190ce7')

package() {
	install -D dprint -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

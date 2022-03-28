# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=dprint-bin
pkgver=0.24.1
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
sha256sums=('3b1b80921f2996b4989e904f90a5cbda77dd510e74c7b94ea7fc46477b310a39'
            '43f8cfbeca17eccd83fc98f27d211073eaee5574fc3162f345acc196d6190ce7')

package() {
	install -D dprint -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

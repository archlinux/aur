# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=dprint-bin
pkgver=0.30.3
pkgrel=1
pkgdesc='Pluggable and configurable code formatting platform'
arch=('x86_64')
url='https://github.com/dprint/dprint'
license=('MIT')
depends=('gcc-libs')
provides=('dprint')
conflicts=('dprint')
source=('LICENSE')
source_x86_64=("$pkgname-$pkgver.zip::$url/releases/download/$pkgver/dprint-x86_64-unknown-linux-gnu.zip")
sha256sums=('43f8cfbeca17eccd83fc98f27d211073eaee5574fc3162f345acc196d6190ce7')
sha256sums_x86_64=('cefdc43953d9e20ec136219a33f9b866d67620e11975135a57562c3beb5b4842')

package() {
	install -D dprint -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

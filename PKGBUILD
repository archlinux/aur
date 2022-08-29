# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=dprint-bin
pkgver=0.31.1
pkgrel=1
pkgdesc='Pluggable and configurable code formatting platform'
arch=('x86_64' 'aarch64')
url='https://github.com/dprint/dprint'
license=('MIT')
depends=('gcc-libs')
provides=('dprint')
conflicts=('dprint')
source=('LICENSE')
source_x86_64=("$pkgname-$pkgver-x86_64.zip::$url/releases/download/$pkgver/dprint-x86_64-unknown-linux-gnu.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::$url/releases/download/$pkgver/dprint-aarch64-unknown-linux-gnu.zip")
sha256sums=('43f8cfbeca17eccd83fc98f27d211073eaee5574fc3162f345acc196d6190ce7')
sha256sums_x86_64=('50ac53a230b44ac4c6f1259dc7223fdfa142bb0b8f15626008b2b770e7ee8e6b')
sha256sums_aarch64=('de1ec7294ddbaabea485ea1f40801d48888d86b6d260ecf4af92467b9d97d5a5')

package() {
	install -D dprint -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

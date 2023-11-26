# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Hoàng Văn Khải <hvksmr1996@gmail.com>

pkgname=dprint-bin
pkgver=0.43.1
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
sha256sums_x86_64=('ae2e4c6530994218a07440ba2245b6106fb137093b15d3703dbf83509a8af2ba')
sha256sums_aarch64=('608d1241acb4392b997677c7c5d96e25dca3ec5d3557f8e632de243ad83b75d6')

package() {
	install -Dv dprint -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# Maintainer: Llathasa Veleth <llathasa at outlook dot com>
pkgname=rralle
pkgver=0.1.1
pkgrel=1
pkgdesc='Random quote fetching console utility'
arch=('x86_64')
url="https://github.com/q60/$pkgname"
license=('MIT')
makedepends=('binutils')
depends=('erlang')
provides=("$pkgname")
source=("$pkgname-$pkgver::$url/releases/download/$pkgver/$pkgname")
sha256sums=('cfa060b81e7980466fb0e1feebe9a9be281fe0a74f78ad115622369c92cad36b')

package() {
	install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}

# Maintainer: Llathasa Veleth <llathasa at outlook dot com>
pkgname=rralle-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Random quote fetching console utility'
arch=('x86_64')
url="https://github.com/q60/rralle"
license=('MIT')
depends=('erlang')
provides=('rralle')
source=("$pkgname-$pkgver::$url/releases/download/$pkgver/rralle")
sha256sums=('cfa060b81e7980466fb0e1feebe9a9be281fe0a74f78ad115622369c92cad36b')

package() {
	install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/rralle"
}

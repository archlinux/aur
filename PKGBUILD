pkgname=catproccpuinfogrepmhz
pkgver=0.1.0
pkgrel=1
pkgdesc="A tool for monitoring CPU frequencies and power usage."
arch=('x86_64')
license=('GPL')
url="https://github.com/ivfiev/catproccpuinfogrepmhz"
depends=()
makedepends=('gcc' 'make')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ivfiev/$pkgname/archive/refs/tags/$pkgver.tar.gz")
md5sums=('fa743d0bfc6e1e3cbb0dd769b054db10')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor:  Maarten de Vries <maarten@de-vri.es>

pkgname=yaml2argdata
pkgver=0.3
pkgrel=2
pkgdesc="C++ header-only library for converting YAML to Argdata"
arch=('any')
url='https://github.com/NuxiNL/yaml2argdata'
license=('BSD')
depends=(
	argdata
	yaml-cpp
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/NuxiNL/yaml2argdata/archive/v$pkgver.tar.gz")
sha512sums=('62a710a45dc971e48d3475654e32446a1a481689cb8a12bdc4ec0e8970f9f0d965a1c00d3c758eda374dd43a6585a9453274a7e45aa35e8dc4098c01c4f49698')


package() {
	install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-$pkgver/LICENSE"
	install -m 644 -D -t "$pkgdir/usr/include/$pkgname"        "$srcdir/$pkgname-$pkgver/$pkgname/"*
}

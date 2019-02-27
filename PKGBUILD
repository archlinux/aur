# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor:  Maarten de Vries <maarten@de-vri.es>

pkgname=yaml2argdata
pkgver=0.4
pkgrel=1
pkgdesc="C++ header-only library for converting YAML to Argdata"
arch=('any')
url='https://github.com/NuxiNL/yaml2argdata'
license=('BSD')
depends=(
	argdata
	yaml-cpp
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/NuxiNL/yaml2argdata/archive/v$pkgver.tar.gz")
sha512sums=('35b7dadbd95ad4acc765b3a237470dd7c47bcbdc323d4f653bf85f0fbad6a95086587371a4e5a4ba3aa15e6ba73b1051df8f9a3c9b4f5479196b687e1335791a')


package() {
	install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-$pkgver/LICENSE"
	install -m 644 -D -t "$pkgdir/usr/include/$pkgname"        "$srcdir/$pkgname-$pkgver/$pkgname/"*
}

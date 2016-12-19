# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=cg-tools
pkgver=1.2
pkgrel=1
pkgdesc="Cooperative gamma tools"
arch=(any)
url="https://github.com/maandree/cg-tools"
license=('GPL3')
depends=(libcoopgamma)
makedepends=(libcoopgamma)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(4fb06b382af4d74004e9f8c4ed9f6c045f9c88ccc674cb974d14f7537df83165)


build() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
}


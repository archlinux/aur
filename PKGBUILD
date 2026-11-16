# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=cg-tools
pkgver=1.4.4
pkgrel=1
pkgdesc="Cooperative gamma tools"
arch=(i686 x86_64 aarch64)
url="https://codeberg.org/maandree/cg-tools"
license=('custom:ISC')
depends=(libcoopgamma)
makedepends=(libcoopgamma libclut)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(6a2365a75acbab6b32f44b5cbd605566b133a7ae2fa940aa5177454b17bdbd19)


build() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir"
}

package() {
	cd "$srcdir/$pkgname"
	make install DESTDIR="$pkgdir"
}


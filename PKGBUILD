# Maintainer: raf <raf at raf dot org>
pkgname=launchmail
pkgver=0.2
pkgrel=1
pkgdesc="SMTP client with a sendmail-compatible wrapper"
arch=("i686" "x86_64" "armv7h" "aarch64")
url=https://libslack.org/launchmail/
license=("GPL")
source=("https://github.com/raforg/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("3dcc8e8926cca6f74ab6ef65889edc414ce4a3d18d9d0eb359cbac207a9debfb")

build()
{
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --destdir="$pkgdir"
	make
}

package()
{
	cd "$pkgname-$pkgver"
	make install
}


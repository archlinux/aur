# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
pkgname=phoneinfoga-bin
pkgver=2.11.0
pkgrel=2
pkgdesc="Information gathering & OSINT framework for phone numbers"
arch=('x86_64')
url="https://sundowndev.github.io/phoneinfoga/"
license=('GPL-3.0-only')
provides=('phoneinfoga')
conflicts=('phoneinfoga')
source=("phoneinfoga_$pkgver.tar.gz::https://github.com/sundowndev/phoneinfoga/releases/download/v$pkgver/phoneinfoga_Linux_x86_64.tar.gz")
sha256sums=("6173dfc4ec009a6fe688068bac5a250646f5a8f56409098f5edcc7e404b12a52")

package() {
	install -Dm755 "phoneinfoga" "$pkgdir"/usr/bin/"$pkgname"
}

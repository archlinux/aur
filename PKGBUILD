# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
pkgname=phoneinfoga
pkgver=v2.10.4
pkgrel=1
pkgdesc="Information gathering & OSINT framework for phone numbers"
arch=('x86_64')
url="https://sundowndev.github.io/phoneinfoga/"
license=('GPL3')
provides=()
source=("https://github.com/sundowndev/phoneinfoga/releases/download/$pkgver/phoneinfoga_Linux_x86_64.tar.gz")
sha256sums=("a38ebacc0ada4a9308d84a33ef6a2d5f124a6be77ae496212c2b86adc141898f")

package() {
	install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}

# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
pkgname=phoneinfoga
pkgver=v2.10.0
pkgrel=1
pkgdesc="Information gathering & OSINT framework for phone numbers"
arch=('x86_64')
url="https://sundowndev.github.io/phoneinfoga/"
license=('GPL3')
provides=()
source=("https://github.com/sundowndev/phoneinfoga/releases/download/$pkgver/phoneinfoga_Linux_x86_64.tar.gz")
sha256sums=("9da117f1e22014cccde1335e4d120d3ab0b5a4e2ebb0303b50b19a50979e7868")

package() {
	install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}

# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
pkgname=phoneinfoga
pkgver=v2.10.5
pkgrel=1
pkgdesc="Information gathering & OSINT framework for phone numbers"
arch=('x86_64')
url="https://sundowndev.github.io/phoneinfoga/"
license=('GPL3')
provides=()
source=("https://github.com/sundowndev/phoneinfoga/releases/download/$pkgver/phoneinfoga_Linux_x86_64.tar.gz")
sha256sums=("1df52601e983ceb810556c61088cd4116d2a4222fd4b5a98887d023471aa072d")

package() {
	install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}

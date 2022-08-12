# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
pkgname=phoneinfoga
pkgver=v2.6.0
pkgrel=1
pkgdesc="Information gathering & OSINT framework for phone numbers"
arch=('x86_64')
url="https://sundowndev.github.io/phoneinfoga/"
license=('GPL3')
provides=()
source=("https://github.com/sundowndev/phoneinfoga/releases/download/$pkgver/phoneinfoga_Linux_x86_64.tar.gz")
sha512sums=("b16d80cbf8341cd10ad77b47d52af80ce40a366b334319f97284ba4785612e528e87dc2a87720689ff2b62393fb0be96f423fa8ac8412c49ed6b8773792c6648")

package() {
	install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}

# Maintainer: GG weebcyberpunk@gmail.com
pkgname=petit-git
pkgver=1.0.0
pkgrel=2
pkgdesc="Keep track of your books in Python."
arch=("x86_64")
url="https://www.github.com/weebcyberpunk/petit"
license=('MIT')
provides=(petit)
depends=(python)
source=("git+$url")
md5sums=('SKIP')

build() {
	cd "petit"

}

package() {
	cd "petit"
	install -Dm755 petit $pkgdir/usr/bin/petit
}

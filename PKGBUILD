pkgname="mlfetch"
pkgver=1.0
pkgrel=1
arch=("x86_64")
pkgdesc="A fetch for minimalizm. Modified for Arch Linux. cr4at4d by MLevankov"
license=("BSD 3-Clause")
url="https://github.com/MLevankov/mlfetch"
depends=("bash")
makedepends=("base-devel")
source=("mlfetch")
md5sums=("SKIP")

build() {
	cd "$srcdir"
	chmod +x ./mlfetch
}

package() {
	cd "$srcdir"
	install -Dm777 ./mlfetch "$pkgdir/usr/local/bin/mlfetch"
}

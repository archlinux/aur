# Maintainer: Luca Popesco
pkgname=gl-gsync-demo
pkgver=2019.03.31
pkgrel=1
pkgdesc="Simple Application to test gsync functionality"
arch=('any')
url="https://github.com/dahenry/gl-gsync-demo"
license=('MIT')
depends=('nvidia' 'nvidia-settings')
makedepends=('git')
optdepends=()
provides=('gl-gsync-demo')
conflicts=('gl-gsync-demo')
source=('git+https://github.com/dahenry/gl-gsync-demo.git')
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	mkdir -p $pkgdir/usr/local/bin
	mv "gl-gsync-demo" $pkgdir/usr/local/bin
}

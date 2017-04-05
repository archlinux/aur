# Maintainer: Max <silverhammermba@gmail.com>
pkgname=launch-cmd
pkgver=1.0.1
pkgrel=3
pkgdesc="Launch an independent process from a shell"
url="https://github.com/silverhammermba/launch"
arch=('any')
license=('GPL')
source=('launch.c')
sha256sums=('SKIP')

build() {
	make launch
}

package () {
	install -Dm755 launch ${pkgdir}/usr/bin/launch
}

# Maintainer: gandalf3 <zzyxpaw at gmail dot com>

pkgname=vopa
pkgver=1.0.0
pkgrel=1
pkgdesc="Midi CC controllable LV2 plugin for Volume/Panning"
arch=('any')
url="https://github.com/ycollet/vopa"
license=('GPL')
depends=('lv2')
makedepends=('git')
source=("git+https://github.com/ycollet/vopa.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}

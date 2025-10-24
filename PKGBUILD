# Maintainer: system64 <system64fumo@tuta.io>

pkgname=mathfairy-git
pkgver=9.9.9
pkgrel=9
pkgdesc="The strongest calculator in gensokyo"
arch=('aarch64' 'riscv64' 'x86_64')
url="https://github.com/System64fumo/mathfairy"
license=('GPL3')
depends=('gtkmm-4.0')
makedepends=('git' 'gcc' 'make')
source=("git+https://github.com/System64fumo/mathfairy")
sha256sums=('SKIP')

build() {
	cd "mathfairy"
	make
}

package() {
	cd "mathfairy"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}

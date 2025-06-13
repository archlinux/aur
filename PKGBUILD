# Maintainer: Konstantin Pereiaslov <perk11@perk11.info>
pkgname=large-model-proxy
pkgver=0.6.2
pkgrel=1
pkgdesc="Make it easy to run multiple resource-heavy Large Models (LM) on the same machine with limited amount of VRAM/other resources."
arch=('x86_64')
url="https://github.com/perk11/large-model-proxy"
license=('GPL-2.0-only')
makedepends=('git' 'go')
source=("git+https://github.com/perk11/large-model-proxy.git?signed#tag=$pkgver")
sha256sums=('SKIP')

build() {
	cd $pkgname
	make
}

package() {
	install -Dm755 $pkgname/large-model-proxy "$pkgdir"/usr/bin/$pkgname
}

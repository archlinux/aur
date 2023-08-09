# Maintainer: zhiayang <zhiayang@nowhere>

pkgname=wgman
pkgver=0.2.3
pkgrel=1
pkgdesc='Simple WireGuard wrapper-manager-thing'
url='https://github.com/zhiayang/wgman'
depends=('wireguard-tools')
makedepends=()
checkdepends=()
license=(Apache)
arch=('any')
_commit='5d85a9e4d800eec3bfe099e8f50ee836ee8944d5'
source=("git+https://github.com/zhiayang/wgman.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
	cd wgman
	make build
}

package() {
	cd wgman
	install -Dm755 build/wgman "$pkgdir"/usr/bin/wgman
}

# Maintainer: Totor <bertlover6969@gmail.com>
pkgname='smol'
pkgver=1.0
pkgrel=1
pkgdesc="Simple Fetch Script"
arch=('x86_64')
url="https://github.com/eeec-cal/smol"
license=('VPL')
makedepends=('git')
source=("smol::git+https://github.com/eeec-cal/smol")
sha256sums=('SKIP')



prepare() {
	cd smol
	chmod +x smol
}

build() {
	cd smol

}

package() {
	cd smol
	sudo mv smol /usr/bin/
}

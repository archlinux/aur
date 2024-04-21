# Maintainer: Totor <bertlover6969@gmail.com>
pkgname='clps'
pkgver=1.0
pkgrel=1
pkgdesc="Folder clearer"
arch=('x86_64')
url="https://github.com/eeec-cal/clps"
license=('MIT')
groups=('torkit')
makedepends=('git')
source=("clps::git+https://github.com/eeec-cal/clps")
sha256sums=('SKIP')



prepare() {
	cd clps
	chmod +x clps
}

build() {
	cd clps

}

package() {
	cd clps
	sudo mv clps /usr/bin/
}

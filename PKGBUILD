# Maintainer: Totor <bertlover6969@gmail.com>
pkgname='pathify'
pkgver=1.0
pkgrel=1
pkgdesc="Move something to the path"
arch=('x86_64')
url="https://github.com/eeec-cal/pathify"
license=('MIT')
groups=('torkit')
makedepends=('git')
source=("pathify::git+https://github.com/eeec-cal/pathify")
sha256sums=('SKIP')



prepare() {
	cd pathify
	chmod +x pathify
}

build() {
	cd pathify

}

package() {
	cd pathify
	sudo mv pathify /usr/bin/
}

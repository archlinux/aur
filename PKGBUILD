# Maintainer: Totor <totor.linuxdev@gmail.com>
pkgname='zz'
pkgver=1.3
pkgrel=1
pkgdesc="AUR Helper Helper"
arch=('x86_64')
url="https://github.com/eeec-cal/zz"
license=('MIT')
depends=('awk' 'sk' 'fzf')
makedepends=('git')
source=("eeec::git+https://github.com/eeec-cal/zz")
sha256sums=('SKIP')



depends=('awk' 'fzf')
makedepends=('git')
source=("zz::git+https://github.com/eeec-cal/zz")
sha256sums=('SKIP')


prepare() {
	cd zz
	chmod +x zz
}

build() {
	cd zz

}

package() {
	cd zz
	sudo mv zz /usr/bin/
}

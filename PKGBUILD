# Maintainer: Totor <totor.linuxdev@gmail.com>
pkgname='zz'
pkgver=$(date | awk -F: '{print $2""$3}' | awk '{print $1$4}')
pkgrel=1
pkgdesc="AUR Helper Helper"
arch=('x86_64')
url="https://github.com/eeec-cal/zz"
license=('MIT')
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

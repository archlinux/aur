# Maintainer: Totor <bertlover6969@gmail.com>
pkgname='eeec'
pkgver=1.1.4
pkgrel=1
pkgdesc="Extremely Elaborate Elegant Calendar"
arch=('x86_64')
url="https://github.com/eeec-cal/eeec"
license=('MIT')
groups=('torkit')
depends=('awk')
makedepends=('git')
source=("eeec::git+https://github.com/eeec-cal/eeec")
sha256sums=('SKIP')



prepare() {
	cd eeec
	chmod +x eeec
	chmod +x install.sh
}

build() {
	cd eeec

}

package() {
	cd eeec
	sudo mv eeec /usr/bin/
	if [[ -e ~/.eeecrc ]]; then
		printf ""
	else
		mv .eeecrc ~/
	fi
}

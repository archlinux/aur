# Maintainer: Austin Ramshur <austinramshur5@gmail.com>
pkgname=acalc-git
pkgver=r4.cfa306d
pkgrel=1
epoch=
pkgdesc="A simple calculator."
arch=(x86_64)
url="https://github.com/aramshur/acalc"
license=("GPL3")
groups=()
depends=(python)
makedepends=(git)
checkdepends=()
optdepends=()
provides=(acalc)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd acalc
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd acalc
	sudo mv acalc /usr/bin/acalc
	sudo mv acalc.py /etc/acalc.py
	chmod +x /usr/bin/acalc
}

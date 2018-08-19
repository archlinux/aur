# Maintainer: Cédric FARINAZZO <cedric.farinazzo@gmail.com>
pkgname=epitarendu
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="TP manager in EPITA"
arch=(any)
url="https://github.com/cedricfarinazzo/EPITA-rendu"
license=('MIT')
makedepends=('python3' 'nuitka')
checkdepends=()
optdepends=()
provides=('screen')
source=()


prepare() {
	git clone https://github.com/cedricfarinazzo/EPITA-rendu.git
}

build() {
	cd EPITA-rendu/
	make
	make build-simple
}

package() {
	cd EPITA-rendu/
	sudo cp ./bin/epitarendu /usr/bin/$pkgname
}

check() {
	cd EPITA-rendu/
}

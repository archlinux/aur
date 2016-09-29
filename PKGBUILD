# Maintainer: Tom Tsagk <tomtsagk at protonmail dot com>
pkgname=ddt 
pkgdesc="platform-agnostic video game programming tools"
pkgver=0.1.0
pkgrel=1
arch=('x86_64' 'i686')
url="http://tomtsagk.github.com"
license=('GPL')
source=("https://www.dropbox.com/s/0w7lt0zdfbpkgp3/ddt-0.1.0.tar")
md5sums=('bc5c54ac7f13160c301a10e0234f389f')

build() {
	./configure -p /usr
	make
}

package() {
	make DEST_DIR=$pkgdir install
}

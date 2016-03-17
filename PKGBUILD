# Maintainer: Tom Tsagk <tomtsagk at protonmail dot com>
pkgname=dargite3d 
pkgdesc="A pong-clone made with opengl, highly moddable"
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
url="http://darkdimensiongames.blogspot.com"
license=('GPL')
depends=('freeglut' 'glew')
source=("https://www.dropbox.com/s/p75xt2rrii5o8lf/dargite3d-1.0.0.tar.gz?dl=0")
md5sums=('90879138571e4e6f5f2f7b05ecd24477')

build() {
	./configure -p /usr
	make
}

package() {
	make DEST_DIR=$pkgdir install
}

# Based on PKGBUILD by Luke Kuza

pkgname=('goofys-bin')
pkgver=0.20.0
pkgrel=1
pkgdesc="Goofys is a high performance Amazon S3 backend filey-system interface"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://github.com/kahing/goofys/"
license=('Apache')
depends=("go" "fuse")
source=('https://github.com/kahing/goofys/releases/download/v0.20.0/goofys')
md5sums=('6284c651df782d30090b0ea250899af2')

package() {
	mkdir -p $pkgdir/usr/bin/
	chmod +x $srcdir/goofys
	cp $srcdir/goofys $pkgdir/usr/bin
}

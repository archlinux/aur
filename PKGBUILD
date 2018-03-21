# Based on PKGBUILD by Luke Kuza

pkgname=('goofys-bin')
pkgver=0.19.0
pkgrel=1
pkgdesc="Goofys is a high performance Amazon S3 backend filey-system interface"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://github.com/kahing/goofys/"
license=('Apache')
depends=("go" "fuse")
source=('https://github.com/kahing/goofys/releases/download/v0.19.0/goofys')
md5sums=('e01f516f3239f2fd6f96841e380f529b')

package() {
	mkdir -p $pkgdir/usr/bin/
	chmod +x $srcdir/goofys
	cp $srcdir/goofys $pkgdir/usr/bin
}

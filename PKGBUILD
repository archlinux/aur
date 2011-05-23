pkgname=applyppf
pkgver=3.0
pkgrel=1
pkgdesc="PPF (Playstation Patch File) v3.0 apply tool"
url="http://www.google.com/search?q=applyppf"
arch=('i686' 'x86_64')
license=('GPL')
source=(applyppf3_linux.c)

md5sums=('b959fce3d4b550f89a74380fbc78c116')

build() {
	gcc -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -o applyppf applyppf3_linux.c
	install -D -m0755 applyppf $pkgdir/usr/bin/applyppf
}

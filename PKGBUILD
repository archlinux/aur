# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=animtext
arch=('i686' 'x86_64')
pkgver=1.0
pkgrel=3
pkgdesc="an SDL based utility to generate text animations in the style of old DOS prompts"
license=('unknown')
url="http://luolamies.org/software/misc/"
depends=('sdl')
source=("https://github.com/callaa/animtext/archive/master.zip")
md5sums=('4ac7fcc6d41770fca98f02c36689c420')

build() {
cd $srcdir/$pkgname-master
make
}

package() {
cd $srcdir/$pkgname-master
install -D -m755 ./animtext $pkgdir/usr/bin/animtext
install -D -m644 ./README $pkgdir/usr/share/doc/animtext/README
#install -D -m644 ./t.txt $pkgdir/usr/share/doc/animtext/t.txt
#install -D -m644 ./test.txt $pkgdir/usr/share/doc/animtext/test.txt
}

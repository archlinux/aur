# Contributor: jose <jose1711 [at] gmail (dot) com>

pkgname=animtext
arch=('i686' 'x86_64')
pkgver=1.0
pkgrel=2
pkgdesc="an SDL based utility to generate text animations in the style of old DOS prompts"
license=('unknown')
url="http://luolamies.org/software/misc/"
depends=('sdl')
source=("http://luolamies.org/software/misc/$pkgname.tar.gz")
md5sums=('5871c00f4396d4eabf70ffb905a20d21')

build() {
cd $srcdir/$pkgname
make || return 1
install -D -m755 ./animtext $pkgdir/usr/bin/animtext
install -D -m644 ./README $pkgdir/usr/share/doc/animtext/README
install -D -m644 ./t.txt $pkgdir/usr/share/doc/animtext/t.txt
install -D -m644 ./test.txt $pkgdir/usr/share/doc/animtext/test.txt
}

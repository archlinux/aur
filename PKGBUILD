# XJump-sdl
# Maintainer: Sterophonick

pkgname=xjump-sdl
pkgver=3.0.4
pkgrel=1
pkgdesc="XJump reimplemented in SDL"
arch=('x86_64' 'i686')
url="https://github.com/hugomg/xjump-sdl"
license=('GPL')
depends=('sdl2')
source=(git+https://github.com/hugomg/xjump-sdl.git)
md5sums=('SKIP')

build() {
	cd $srcdir/xjump-sdl
	./configure
	make
}


package() {
	cd $srcdir/xjump-sdl
	install -D ./xjump $pkgdir/usr/local/bin/xjump
	install -m 644 -D data/font-hs.bmp $pkgdir/usr/local/share/xjump/font-hs.bmp
	install -m 644 -D data/font-ui.bmp $pkgdir/usr/local/share/xjump/font-ui.bmp
	install -m 644 -D data/themes/classic.bmp $pkgdir/usr/local/share/xjump/themes/classic.bmp
	install -m 644 -D data/themes/ion.bmp $pkgdir/usr/local/share/xjump/themes/ion.bmp
	install -m 644 -D data/themes/jumpnbump.bmp $pkgdir/usr/local/share/xjump/themes/jumpnbump.bmp
	install -m 644 -D misc/xjump.6.gz $pkgdir/usr/local/share/man/man6/xjump.6.gz
	install -m 644 -D misc/icon32.png $pkgdir/usr/local/share/icons/hicolor/32x32/apps/br.com.gualandi.Xjump.png
	install -m 644 -D misc/icon64.png $pkgdir/usr/local/share/icons/hicolor/64x64/apps/br.com.gualandi.Xjump.png
	install -m 644 -D misc/icon128.png $pkgdir/usr/local/share/icons/hicolor/128x128/apps/br.com.gualandi.Xjump.png
	install -m 644 -D misc/br.com.gualandi.Xjump.desktop $pkgdir/usr/local/share/applications/br.com.gualandi.Xjump.desktop
	install -m 644 -D misc/br.com.gualandi.Xjump.metainfo.xml $pkgdir/usr/local/share/metainfo/br.com.gualandi.Xjump.metainfo.xml

}


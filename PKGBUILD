# Maintainer: jose1711 <jose1711@gmail.com>

pkgname=xlite_bin
pkgver=2.0
pkgrel=4
pkgdesc="a multiplatform fully functioning softphone (binary only)"
arch=('i686')
url="http://www.counterpath.net/x-lite"
license=('custom')
source=("http://gentoo.mirrors.pair.com/distfiles/X-Lite_Install.tar.gz" "xlite.desktop")
md5sums=('6041fa4b2c553407373e6020c55da4ae' 'de98459edd82d90dcb40ccc62a47c6b5')
depends=('libstdc++5' 'libglade')

build() {
true
}

package() {
	cd $srcdir/xten-xlite
        install -D -m 755 xtensoftphone $pkgdir/usr/bin/xtensoftphone
        install -D -m 644 ../xlite.desktop \
        $pkgdir/usr/share/applications/xlite.desktop
	}

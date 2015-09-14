# Maintainer: jose1711 <jose1711@gmail.com>

pkgname=xlite_bin
pkgver=2.0
pkgrel=5
pkgdesc="a multiplatform fully functioning softphone (binary only)"
arch=('i686')
url="http://www.counterpath.net/x-lite"
license=('custom')
source=("https://www.dropbox.com/s/68ll5ine6uq7pcp/X-Lite_Install.tar.gz?dl=0" "xlite.desktop")
md5sums=('6041fa4b2c553407373e6020c55da4ae' 'de98459edd82d90dcb40ccc62a47c6b5')
depends=('libstdc++5' 'libglade')

package() {
	cd $srcdir/xten-xlite
        install -D -m 755 xtensoftphone $pkgdir/usr/bin/xtensoftphone
        install -D -m 644 ../xlite.desktop \
        $pkgdir/usr/share/applications/xlite.desktop
	}

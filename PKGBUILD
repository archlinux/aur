# Maintainer: jose1711 <jose1711 at gmail dot com>

pkgname=jpegtran_crop_bin
pkgver=9e
pkgrel=1
pkgdesc="Stable jpegtran version with the lossless crop and scale feature"
arch=('i686' 'x86_64')
depends_x86_64=('lib32-glibc')
url="http://sylvana.net/jpegcrop/jpegtran/"
license=('other')
source=("http://sylvana.net/jpegcrop/jpegcrop.tar.gz")
md5sums=('a3973a555dd0148db130d8b84c9b974b')
conflicts=('jpegtran_crop')

package() {
	cd ${srcdir}/jpegcrop/jpeg-${pkgver}
	install -D -m 755 jpegtran $pkgdir/usr/bin/jpegtran
	}

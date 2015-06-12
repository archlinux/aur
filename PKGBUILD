# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=flac2ogg
pkgver=0.6
pkgrel=5
pkgdesc="a python script to convert FLAC files to OGG format"
arch=('any')
url="http://members.fortunecity.com/stateq/flac2ogg.html"
license=('GPL')
depends=('python2' 'vorbis-tools' 'flac')
optdepends=('shntool')
#source=("http://members.fortunecity.com/stateq/scripts/flac2ogg-${pkgver}.zip")
source=("http://web.archive.org/web/20120320093211/http://members.fortunecity.com/stateq/scripts/flac2ogg-0.6.zip")
md5sums=('8676a347aaebe92e997eb4226b9e5b73')

build() {
	sed -i '1s/python/python2/' ${srcdir}/${pkgname}-${pkgver}/${pkgname}
}

package() {
	install -Dm 755 ${srcdir}/${pkgname}-${pkgver}/${pkgname} ${pkgdir}/usr/bin/flac2ogg
}

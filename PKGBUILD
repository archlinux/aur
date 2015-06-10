# Contributor: ianux <ianux@free.fr>
pkgname=myrtille
pkgver=0.6.1
pkgrel=1
pkgdesc="picture sequence capture tool"
arch=('i686')
url="http://festival.inattendu.org/Myrtille-Linux"
license=('GPL')
depends=('ffmpeg' 'gnome-python' 'gstreamer0.10-base-plugins' 'gstreamer0.10-bad-plugins' \
	'gstreamer0.10-good-plugins' 'gstreamer0.10-python' 'imagemagick' 'pil')
source=(http://launchpad.net/myrtille/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz)
md5sums=('ab49449c7aec6e6ca664bb3620322f40')
install=${pkgname}.install

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make || return 1
  make DESTDIR=${pkgdir} install
}

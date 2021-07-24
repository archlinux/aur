# Maintainer: Astroncia <kestraly+gmail+com>

pkgname=astronciaiptv
pkgver=0.0.54
pkgrel=1
pkgdesc="IPTV player"
arch=('any')
url="https://gitlab.com/astroncia/iptv"
license=('GPL3')
depends=('python' 'qt5-base' 'qt5-multimedia' 'qt5-x11extras' 'mpv' 'python-pyqt5' 'python-pillow' 'python-pandas' 'python-gobject' 'python-pydbus' 'python-unidecode' 'python-requests' 'ffmpeg')
source=("${pkgname}_${pkgver}.deb::https://gitlab.com/astroncia/iptv-binaries/-/raw/master/normal/astronciaiptv-0.0.54.deb")
sha512sums=('SKIP')

package() {
	cd "${srcdir}"
	bsdtar -xf data.tar.xz -C "${pkgdir}"
	chmod 755 "${pkgdir}"/usr/bin/astronciaiptv
}

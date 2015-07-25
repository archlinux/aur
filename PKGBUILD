# Maintainer: Alexandre Magno <alexandre.mbm@gmail.com>
pkgname=dangerous-jack-connector
pkgver=0.1.4
pkgrel=1
srcauthor=alexandre-mbm
pkgdesc="Alarm for dangerous jack connector (faulty plug of the notebook's power supply)"
url="https://github.com/${srcauthor}/${pkgname}"
arch=(any)
license=('MIT')
depends=('sh' 'systemd' 'sound-theme-freedesktop' 'ffmpeg' 'alsa-utils')
install=${pkgname}.install
source=("https://github.com/${srcauthor}/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('bc9eeb43736567a0d301cf500d3ef9ff')

package(){
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}/" install
}


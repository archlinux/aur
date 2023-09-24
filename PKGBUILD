# Maintainer: onurmercury <onurmercury at proton dot me>

# New releases and details about builds can be found at:
# https://github.com/Stremio/stremio-service/

_debname=stremio-service

pkgname=${_debname}-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Companion app for Stremio Web"
arch=('x86_64')
url="https://github.com/Stremio/stremio-service"
license=('GPL-2.0')
depends=('glib2'
         'gcc-libs'
         'gdk-pixbuf2'
         'gtk3'
         'cairo')
conflicts=('stremio-service')
source=("https://github.com/Stremio/stremio-service/releases/download/v${pkgver}/${_debname}_amd64.deb")
sha256sums=('ec708e51b85cff21c203afb66ec1c63aef2f39dc3ac2156fdaae08f5d432d000')

package() {

  bsdtar -xf data.tar.xz -C "${pkgdir}/"

}

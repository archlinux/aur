# Maintainer: tuxflo

pkgname=ecodmsclient
pkgver=16.09.2
pkgrel=3
pkgdesc="Document Management Software"
arch=('x86_64')
url="http://www.ecodms.de/index.php/de/"
license=('custom')
depends=('bash' 'libappindicator-gtk2' 'qt5-svg' 'qt5-x11extras' 'libpng12' 'freeimage')
options=('!strip')
install=${pkgname}.install

source_x86_64=("ecodmsclient-${pkgver}_amd64.deb::http://www.ecodms.de/ecodms_160964/xenial/./ecodmsclient-16.09-2-0_amd64.deb")

md5sums_x86_64=('b1d8c27a12b2fb235dfb1f26a204532b')

package() {
  cd "${srcdir}"
  tar -xf data.tar.xz

# Install
  cp -dr --no-preserve=ownership etc opt usr "${pkgdir}"/

}

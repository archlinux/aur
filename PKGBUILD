# Maintainer: tuxflo

pkgname=ecodmsclient
pkgver=16.09.1
pkgrel=2
pkgdesc="Document Management Software"
arch=('x86_64')
url="http://www.ecodms.de/index.php/de/"
license=('custom')
depends=('bash' 'libappindicator-gtk2' 'qt5-svg' 'qt5-x11extras' 'libpng12' 'freeimage')
options=('!strip')
install=${pkgname}.install

source_x86_64=("ecodmsclient-${pkgver}_amd64.deb::http://www.ecodms.de/ecodms_160964/xenial/./ecodmsclient-16.09-1_amd64.deb")

md5sums_x86_64=('8eb936a67b53164f12284e6b872bc9f3')

package() {
  cd "${srcdir}"
  tar -xf data.tar.xz

# Install
  cp -dr --no-preserve=ownership etc opt usr "${pkgdir}"/

}

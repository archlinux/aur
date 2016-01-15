# Maintainer: tuxflo

pkgname=ecodmsclient
pkgver=14.08.12
pkgrel=1
pkgdesc="Document Management Software"
arch=('i686' 'x86_64')
url="http://www.ecodms.de/index.php/de/"
license=('custom')
depends=('bash')
options=('!strip')
install=${pkgname}.install

source_i686=("ecodmsclient-${pkgver}_i386.deb::http://www.ecodms.de/ecodms_140832/trusty/ecodmsclient-14.08-12-1_i386.deb");
source_x86_64=("ecodmsclient-${pkgver}_amd64.deb::http://www.ecodms.de/ecodms_140864/trusty/ecodmsclient-14.08-12-1_amd64.deb")

md5sums_i686=('07fa57abb89c82580c1072df6e08d5ba')
md5sums_x86_64=('7d1ee9e4048900b84073a585d172a536')

package() {
  cd "${srcdir}"
  tar -xf data.tar.xz

# Install
  cp -dr --no-preserve=ownership etc opt usr "${pkgdir}"/

}

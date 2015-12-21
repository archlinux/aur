# Maintainer: tuxflo

pkgname=ecodmsclient
pkgver=14.08.11
pkgrel=1
pkgdesc="Document Management Software"
arch=('i686' 'x86_64')
url="http://www.ecodms.de/index.php/de/"
license=('custom')
depends=('bash')
options=('!strip')
install=${pkgname}.install

source_i686=("ecodmsclient-${pkgver}_i386.deb::http://www.ecodms.de/ecodms_140832/trusty/ecodmsclient-14.08-12_i386.deb");
source_x86_64=("ecodmsclient-${pkgver}_amd64.deb::http://www.ecodms.de/ecodms_140864/trusty/ecodmsclient-14.08-12_amd64.deb")

md5sums_i686=('e4c55f2e451d7de0c6afb16008a58fce')
md5sums_x86_64=('568084420989e9882c496beaba894362')

package() {
  cd "${srcdir}"
  tar -xf data.tar.xz

# Install
  cp -dr --no-preserve=ownership etc opt usr "${pkgdir}"/

}

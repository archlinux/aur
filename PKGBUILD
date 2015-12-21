# Maintainer: tuxflo
# To change the installation language from english to german
# copy the file /opt/ecodms/ecoice/language_de.qm to /opt/ecodms/ecice/language.qm
pkgname=ecoice
pkgver=14.08.12
pkgrel=1
pkgdesc="Image correction Editor for EcoDMS Document Management Software"
arch=('i686' 'x86_64')
url="http://www.ecodms.de/index.php/de/"
license=('custom')
depends=('bash' 'pcre' 'ecodmsclient')
options=('!strip')
install=${pkgname}.install

source_i686=("ecoice-${pkgver}_i386.deb::http://www.ecodms.de/ecodms_140832/trusty/ecoice-14.08-12_i386.deb")
source_x86_64=("ecoice-${pkgver}_amd64.deb::http://www.ecodms.de/ecodms_140864/trusty/ecoice-14.08-12_amd64.deb")

md5sums_i686=('bdb831991fd32a0cea3705a9388372f5')
md5sums_x86_64=('2dc1193025b4c38695a0151a74105cd4')

package() {
  cd "${srcdir}"
  tar -xf data.tar.xz

# Install
  cp -dr --no-preserve=ownership opt usr "${pkgdir}"/
}

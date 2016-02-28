# Maintainer: Jameson Pugh <imntreal@gmail.com>
 
pkgname=shashlik-bin
pkgver=0.9.1
pkgrel=2
pkgdesc="run Android applications on a standard Linux desktop"
arch=('any')
url="http://www.shashlik.io"
license=('GPL')
depends=('python' 'lib32-libgl' 'kdebase-kdialog')
conflicts=('shashlik')
provides=('shashlik')
source=("http://static.davidedmundson.co.uk/shashlik/shashlik_${pkgver}.deb")
sha256sums=('888c535a9ff2e8563712cbe0fa3a208ccb21f9f90d66a434fb4c40fce6404520')
 
package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/shashlik/bin/shashlik-run "${pkgdir}/usr/bin/"
  ln -s /opt/shashlik/bin/shashlik-install "${pkgdir}/usr/bin/"
}
 
# vim:set ts=2 sw=2 et:

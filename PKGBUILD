# Maintainer: Jameson Pugh <imntreal@gmail.com>
 
pkgname=shashlik-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="run Android applications on a standard Linux desktop"
arch=('any')
url="http://www.shashlik.io"
license=('GPL')
depends=('python' 'lib32-libgl' 'kdebase-kdialog')
conflicts=('shashlik')
provides=('shashlik')
source=("http://static.davidedmundson.co.uk/shashlik/shashlik_${pkgver}.deb")
sha256sums=('9f5392c1687f532369f1df98fe89588c8c1d8217e23e497af329ba8d25e74641')
 
package() {
  cd "${srcdir}"
  
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/shashlik/bin/shashlik-run "${pkgdir}/usr/bin/"
  ln -s /opt/shashlik/bin/shashlik-install "${pkgdir}/usr/bin/"
}
 
# vim:set ts=2 sw=2 et:

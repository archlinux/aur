# Maintainer: Jameson Pugh <imntreal@gmail.com>
 
pkgname=shashlik-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="run Android applications on a standard Linux desktop"
arch=('any')
url="http://www.shashlik.io"
license=('GPL')
depends=('python' 'lib32-libgl')
makedepends=('deb2targz')
conflicts=('shashlik')
provides=('shashlik')
source=("http://static.davidedmundson.co.uk/shashlik/shashlik_${pkgver}.deb")
sha256sums=('888c535a9ff2e8563712cbe0fa3a208ccb21f9f90d66a434fb4c40fce6404520')
 
package() {
  cd "${srcdir}"
  
  tar -xJvC "${pkgdir}" -f data.tar.xz
}
 
# vim:set ts=2 sw=2 et:

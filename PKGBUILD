# Maintainer: ninian <mcfadzean.org.uk ta linux>
pkgname=portabase-bin
_pkgname=${pkgname%-bin}
pkgver=2.1
pkgrel=1
pkgdesc="PortaBase manages one-table database files (binary from Debian package)"
arch=('i686' 'x86_64')
url="http://portabase.sourceforge.net"
license=('GPL2')
depends=('qt4')
install="$pkgname.install"
source=(http://sourceforge.net/projects/portabase/files/portabase/${pkgver}/${_pkgname}_${pkgver}-1_i386.deb/download)
md5sums=('2d4d3ce12506a155b44bd46c75e9e15c')

package() {
  cd "$srcdir"
  ar x download
  tar xzf data.tar.gz -C "$pkgdir/"
}

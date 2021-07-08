# Maintainer: Matthias De Bie <mattydebie@gmail.com>

pkgname="kimai2-console"
pkgdesc="PHP Command line client for Kimai."
pkgver="0.3.3"
pkgrel=1
url="https://github.com/kevinpapst/kimai2-console"
arch=('i686' 'x86_64')
license=('unknown')
source=("https://github.com/kevinpapst/kimai2-console/releases/download/0.3.3/kimai.phar")
sha256sums=('113e35de2a8045c2ad0510eea78076f3ac684a8af973c0b2bf7b0fa42e065103')
depends=("php>=7")

package() {
  chmod +x kimai.phar
  mkdir $pkgdir/usr/bin -p
  cp -f kimai.phar "${pkgdir}/usr/bin/kimai"
}

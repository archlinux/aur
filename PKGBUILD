# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>
# I don't provide Packages for a higher version because they are not open source anymore (somehow)

pkgname=fruit
pkgver=2.1
pkgrel=3
pkgdesc="UCI chess engine developed by Fabien Letouzey"
url="http://arctrix.com/nas/chess/fruit/"
arch=('i686' 'x86_64')
license=('GPL')
source=("http://arctrix.com/nas/chess/$pkgname/${pkgname}_21_linux.zip")
md5sums=("35e538708a036f58aa88a7acee6a2030")

build() {
  cd "${srcdir}/${pkgname}_21_linux/src/"
  make
}

package() {
  cd "${srcdir}/${pkgname}_21_linux/src/"
  install -Dm0755 $pkgname ${pkgdir}/usr/bin/$pkgname
}

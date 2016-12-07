# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Noel Kuntze <noel@familie-kuntze.de>

pkgname=pcs
pkgver=0.9.155
pkgrel=1
pkgdesc='pacemaker corosync shell utility for cluster configuration'
arch=('any')
url='http://clusterlabs.org/'
license=('GPL2')
depends=('python')
source=("https://github.com/ClusterLabs/$pkgname/archive/$pkgver.tar.gz")
md5sums=('5c36c47c7f2199c93716e2b4e641e919')

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}

# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=convoy
pkgver=0.5.0
_pkgver_rc=
pkgrel=2
pkgdesc="A Docker volume plugin, managing persistent container volumes"
arch=(x86_64)
url="https://github.com/rancher/convoy"
license=('Apache')
depends=('docker')
install=$pkgname.install
source=("convoy-$pkgver.tar.gz::https://github.com/rancher/$pkgname/releases/download/v${pkgver/rc?/}$_pkgver_rc/$pkgname.tar.gz")
md5sums=('051803f6b3d1fc40834fd65031a15e3f')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/bin
  cp convoy/convoy convoy/convoy-pdata_tools $pkgdir/usr/bin
}

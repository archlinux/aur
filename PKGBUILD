# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=convoy
pkgver=0.5.0rc1
_pkgver_rc=-rc1
pkgrel=1
pkgdesc="A Docker volume plugin, managing persistent container volumes"
arch=(x86_64)
url="https://github.com/rancher/convoy"
license=('Apache')
depends=('docker')
install=$pkgname.install
source=("https://github.com/rancher/$pkgname/releases/download/v${pkgver/rc?/}$_pkgver_rc/$pkgname.tar.gz")
md5sums=('412f2b14e523c92eb5f75e84922a7bdb')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/bin
  cp convoy/convoy convoy/convoy-pdata_tools $pkgdir/usr/bin
}

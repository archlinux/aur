# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=convoy
pkgver=0.4.3
pkgrel=1
pkgdesc="A Docker volume plugin, managing persistent container volumes"
arch=(x86_64)
url="https://github.com/rancher/convoy"
license=('Apache')
depends=('docker')
install=$pkgname.install
source=("https://github.com/rancher/$pkgname/releases/download/v$pkgver/$pkgname.tar.gz")
md5sums=('bec6a4d2c944f1c7e1a14eeb7ab67ed5')

package() {
	mkdir -p $pkgdir/usr/bin
	cp convoy/convoy convoy/convoy-pdata_tools $pkgdir/usr/bin
}

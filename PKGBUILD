# Maintainer: Md. Jahidul Hamid <jahidulhamid@yahoo.com>
pkgname=gencsr
pkgver=0.0.3
pkgrel=1
pkgdesc="Simple CSR generator"
arch=(any)
url="https://github.com/neurobin/gencsr"
license=('BSD')
depends=(bash openssl)
source=( "https://github.com/neurobin/$pkgname/archive/$pkgver.tar.gz" )
md5sums=('f7318349d2f133463504c1363eb4edbc')
validpgpkeys=('3331 6137 5B22 27AC F7AA  6351 A4A2 CA5B 6BDA A871')

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

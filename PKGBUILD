# Maintainer: Gabriele Russo Russo <gabri.russo17 AT gmail.com>
pkgname=easybackup
pkgver=1.0
pkgrel=1
pkgdesc="Bash script for performing incremental backups of a set of directories using rsync"
arch=('any')
url="https://github.com/childerico/$pkgname"
license=('GPL')
depends=('bash' 'rsync')
source=("https://github.com/childerico/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('5ff9683d90209e6320ba0379687918de')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

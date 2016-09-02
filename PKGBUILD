# Maintainer: Gabriele Russo Russo <gabri.russo17 AT gmail.com>
pkgname=easybackup
pkgver=1.1
pkgrel=1
pkgdesc="Bash script for performing incremental backups of a set of directories using rsync"
arch=('any')
url="https://github.com/childerico/$pkgname"
license=('GPL')
depends=('bash' 'rsync')
source=("https://github.com/childerico/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('6fe2b36bbc15660661cf4e78ca37fd6c')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

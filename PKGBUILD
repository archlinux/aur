# Maintainer: Gabriele Russo Russo <gabri.russo17 AT gmail.com>
pkgname=easybackup
pkgver=1.3
pkgrel=1
pkgdesc="Bash script for performing incremental backups of a set of directories using rsync"
arch=('any')
url="https://github.com/childerico/$pkgname"
license=('GPL')
depends=('bash' 'rsync')
source=("https://github.com/childerico/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('d8efbc57e0b78eb221e996a505f2a789')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

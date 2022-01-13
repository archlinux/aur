# Maintainer: Gabriele Russo Russo <gabri.russo17 AT gmail.com>
pkgname=easybackup
pkgver=1.4
pkgrel=0
pkgdesc="Bash script for performing incremental backups of a set of directories using rsync"
arch=('any')
url="https://github.com/grussorusso/$pkgname"
license=('GPL')
depends=('bash' 'rsync')
source=("https://github.com/grussorusso/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('21cdb281c9fc6aef6101d7db8abfefc4')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

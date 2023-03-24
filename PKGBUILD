# Maintainer: Manuel Domínguez López <mdomlopatgmaildotcom>
_pkgver_year=2023
_pkgver_month=02
_pkgver_day=27
pkgname=sskit
pkgver=0.6b
pkgrel=1
pkgdesc="Make snapshots in a Btrfs filesystem."
license=("GPLv3+")
url="https://github.com/mdomlop/sskit"
backup=('etc/sstab')
arch=("i686" "x86_64")
makedepends=('btrfs-progs')
source=("https://github.com/mdomlop/$pkgname/archive/refs/tags/$pkgver.tar.gz")

build() {
	cd $pkgname-$pkgver
	make
}

package() {
	cd $pkgname-$pkgver
	make install DESTDIR=$pkgdir
}
md5sums=('c64b9632678dba5261afcfd7d006daf6')

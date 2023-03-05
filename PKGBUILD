# Maintainer: Manuel Domínguez López <mdomlopatgmaildotcom>
_pkgver_year=2023
_pkgver_month=02
_pkgver_day=27
pkgname=sstools
pkgver=0.5b
pkgrel=1
pkgdesc="KISS tools for make snapshots in a Btrfs filesystem."
license=("GPLv3+")
url="https://github.com/mdomlop/sstools"
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
md5sums=('bbbb0d9cc381b39d492a4480cd9e10c5')

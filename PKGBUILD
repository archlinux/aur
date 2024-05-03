# Maintainer: Totor <totor.linuxdev@gmail.com>
pkgname='zz'
pkgver=1.4
pkgrel=1
pkgdesc="AUR Helper Helper"
arch=('x86_64')
url="https://github.com/eeec-cal/zz"
license=('MIT')
depends=('awk' 'skim')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/eeec-cal/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')


prepare() {
	cd $pkgname-$pkgver
	chmod +x zz
}

build() {
	cd $pkgname-$pkgver

}

package() {
	cd $pkgname-$pkgver
	sudo mv $pkgname /usr/bin/
}

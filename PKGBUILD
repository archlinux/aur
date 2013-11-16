# Contributor: Vasco Costa <vasco.costa@meiodigital.com>
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=bingrep
pkgver=0.1
pkgrel=1
pkgdesc='Small binary version of grep'
arch=(i686 x86_64)
url='http://sourceforge.net/projects/bingrep/'
license=('GPL')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('5ab4a69fdcc7d65cc71292bc6b9582ab')

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" install
}

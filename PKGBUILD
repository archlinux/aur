# Maintainer: Roshless <pkg@roshless.com>

pkgname=ttea
pkgrel=4
pkgver=1.2.1
pkgdesc="CLI tea manager"
url="https://git.roshless.me/~roshless/ttea"
arch=('x86_64' 'i686')
license=("GPL")
source=("https://git.roshless.me/roshless/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
depends=('glibc')
optdepends=('mpv: play timer sound' 'mplayer: alternative player')

build() {
	cd $pkgname-$pkgver
	make PREFIX="/usr"
}

package() {
	cd $pkgname-$pkgver
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}

md5sums=('aaacf75cccc3eb3eeab96a4451905db4')

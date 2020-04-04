# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=declick
pkgver=0.6.5
pkgrel=1
pkgdesc="Dynamic Digital Declicker for wave files"
arch=('x86_64')
url="http://home.snafu.de/wahlm/dl8hbs/declick.html"
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::http://home.snafu.de/wahlm/dl8hbs/declick-${pkgver}.tar.gz")
md5sums=('415f4da925f6573868ae10dbb79b8f5b')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make all
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 declick "${pkgdir}/usr/bin/declick"
}
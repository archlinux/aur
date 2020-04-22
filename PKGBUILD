# Maintainer: Rishabh Dwivedi <rishabhdwivedi17@gmail.com>
pkgname=gohup
pkgver=0.2
pkgrel=1
pkgdesc="Command-line utility to run you program in background without any interruption."
arch=('i686' 'x86_64')
url="https://github.com/RishabhRD/gohup"
license=('GPLv3')
depends=('sh')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RishabhRD/gohup/archive/$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
md5sums=('aa983e963c000362e4bc2e279be65db8')
md5sums=('0aeb6f81ba506a59537c809c60660071')

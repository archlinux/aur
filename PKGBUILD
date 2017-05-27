
pkgname=id3ren
pkgver=master
pkgrel=1

pkgdesc="Batch rename mp3 files by reading ID3 tags"
arch=('i686' 'x86_64')
url="https://github.com/sebcode/id3ren"
license=('GPL')
source=('https://github.com/sebcode/id3ren/archive/master.zip')
md5sums=('e3cba13748f2670b1392d17223592756')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

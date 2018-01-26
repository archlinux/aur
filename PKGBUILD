pkgname=flash-merger
pkgver=1.2.11
pkgrel=1
pkgdesc='Fast Length Adjustment of SHort reads: Fast and accurate software tool to merge paired-end reads from next-generation sequencing experiments.'
url='https://ccb.jhu.edu/software/FLASH'
license=(GPLv3)
arch=(i686 x86_64)
conflicts=(flash-trimmer)
replaces=(flash-trimmer)
source=("https://downloads.sourceforge.net/project/flashpage/FLASH-$pkgver.tar.gz")
md5sums=('e4d355023a766afaaab2d62f912b605c')

build() {
	cd "$srcdir/FLASH-$pkgver"
	make
}

package() {
	install -Dm755 "$srcdir/FLASH-$pkgver/flash" "$pkgdir/usr/bin/flash"
}

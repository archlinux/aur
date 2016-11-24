pkgname=fqgrep
pkgver=0.4.4
pkgrel=1
arch=(any)
pkgdesc='An approximate sequence pattern matcher for FASTQ/FASTA files'
url="https://github.com/indraniel/fqgrep"
source=("$url/archive/v$pkgver.tar.gz")
makedepends=(libtool autoconf automake)
depends=(zlib tre)
md5sums=('18d5b1ad9926b302bfd92ed19f66bb34')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	mkdir -p $pkgdir/usr/bin
	cp "$srcdir/$pkgname-$pkgver/$pkgname" $pkgdir/usr/bin/
}

# Maintainer:  Eric Biggers <ebiggers3@gmail.com>

pkgname=pirs
pkgver=1.10
pkgrel=1
pkgdesc="A program for simulating Illumina paired-end DNA reads from a genome"
arch=('i686' 'x86_64')
url="http://bio-bwa.sourceforge.net/"
license=('GPL')
source=('http://pirs.googlecode.com/files/pIRS_110.tgz')
depends=('gzip' 'perl' 'gnuplot' 'coreutils' 'samtools' 'zlib')

build() {
	cd pIRS_110
	make
}

package() {
	cd pIRS_110
	PREFIX=${pkgdir}/usr/bin make install
}

md5sums=('cb5590a9156967cbdc16eb8f472a3354')

# Maintainer: Jozef Riha <jose1711 at gmail dot com>
pkgname=flac2mp3
pkgver=0.3.0rc3
pkgrel=5
pkgdesc="a perl script to convert FLAC files to MP3 format"
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/flac2mp3/"
license=('GPL')
depends=('perl' 'perl-data-dump' 'perl-file-find-rule' 'perl-audio-flac-header' 'perl-file-which' 'perl-mp3-tag' 'perl-proc-parallelloop')
source=("http://projects.robinbowes.com/download/flac2mp3/${pkgname}-${pkgver}.tar.gz")
md5sums=('b4fe3c038ce5b251964e9920fc376d22')

build() {
true
}

package() {
	mkdir -p $pkgdir/usr/share/doc/flac2mp3
	cd $srcdir/${pkgname}-${pkgver}
	install -Dm 755 ./flac2mp3.pl $pkgdir/usr/bin/flac2mp3.pl
	install -Dm 644 ./*.txt $pkgdir/usr/share/doc/flac2mp3/
}

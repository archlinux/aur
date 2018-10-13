# Maintainer: Jozef Riha <jose1711 at gmail dot com>
# Contributor: Holzhaus

pkgname=flac2mp3
pkgver=1.0.0
pkgrel=2
pkgdesc="a perl script to convert FLAC files to MP3 format"
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/flac2mp3/"
license=('GPL')
depends=('perl' 'perl-data-dump' 'perl-file-find-rule' 'perl-audio-flac-header' 'perl-file-which' 'perl-mp3-tag' 'perl-proc-parallelloop' 'perl-freezethaw')
source=("https://github.com/robinbowes/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('e9b17ceec38ee68c5c49f68289e34b9a')

package() {
	mkdir -p $pkgdir/usr/share/doc/flac2mp3
	cd $srcdir/${pkgname}-${pkgver}
	install -Dm 755 ./flac2mp3.pl $pkgdir/usr/bin/flac2mp3.pl
	install -Dm 644 ./*.txt $pkgdir/usr/share/doc/flac2mp3/
}

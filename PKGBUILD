# Maintainer: Alif <alive4ever at live dot com>

pkgname=perl-archive-zip-crc32
pkgdesc="Provides a Debian manpage for crc32 command line from perl-archive-zip"
pkgver=1.57
pkgrel=1
arch=("any")
url="https://packages.debian.org/sid/libarchive-zip-perl"
license=('GPL' 'PerlArtistic')
depends=("perl-archive-zip")
source=("http://httpredir.debian.org/debian/pool/main/liba/libarchive-zip-perl/libarchive-zip-perl_${pkgver}-${pkgrel}.debian.tar.xz")
sha256sums=('d0428915e54b8b2236cc7ad48498c7c52d173ac22b7b41e7c6a7ce20d43dba1f')

package() {
	mkdir -p $pkgdir/usr/share/man/man1/
	gzip -9 $srcdir/debian/crc32.1
	install -m 644 $srcdir/debian/crc32.1.gz $pkgdir/usr/share/man/man1/crc32.1.gz
}

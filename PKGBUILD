# Maintainer: Alif <alive4ever at live dot com>

pkgname=perl-archive-zip-crc32
pkgdesc="Provides a Debian manpage for crc32 command line from perl-archive-zip"
pkgver=1.58
pkgrel=1
arch=("any")
url="https://packages.debian.org/sid/libarchive-zip-perl"
license=('GPL' 'PerlArtistic')
depends=("perl-archive-zip")
source=("http://httpredir.debian.org/debian/pool/main/liba/libarchive-zip-perl/libarchive-zip-perl_${pkgver}-${pkgrel}.debian.tar.xz")
sha256sums=('4303c67c7a4c4b7649775d814b6d199309cee59322f3323d6f44895f0f101a67')

package() {
	install -Dm 644 $srcdir/debian/crc32.1 $pkgdir/usr/share/man/man1/crc32.1
}

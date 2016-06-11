# Maintainer: Alif <alive4ever at live dot com>

pkgname=perl-archive-zip-crc32
pkgdesc="Compute CRC-32 checksum"
pkgver=1.57
pkgrel=1
arch=("any")
url="https://packages.debian.org/sid/libarchive-zip-perl"
license=('GPL' 'PerlArtistic')
depends=("perl-archive-zip")
source=("http://httpredir.debian.org/debian/pool/main/liba/libarchive-zip-perl/libarchive-zip-perl_${pkgver}-${pkgrel}_all.deb")
sha256sums=('fc1cba1df9df9a53ddac264fbb281314814c6f9df17c67e924dd495afe1f3318')

package() {
	cd $srcdir
	bsdtar -C $pkgdir -xf data.tar.xz ./usr/bin/crc32 ./usr/share/man/man1/crc32.1.gz
}

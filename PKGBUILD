# Contributor: wallace < str(11) + my_id at gmail dot com>
# Contributor: Alif <alive4ever at live dot com>

_name=libarchive-zip-perl
pkgname=perl-archive-zip-crc32
pkgdesc="Provides a Debian manpage for crc32 command line from perl-archive-zip"
pkgver=1.68
pkgrel=1
arch=("any")
url="https://packages.debian.org/sid/libarchive-zip-perl"
license=('GPL' 'PerlArtistic')
depends=("perl-archive-zip")
source=(https://salsa.debian.org/perl-team/modules/packages/${_name}/-/archive/archive/debian/${pkgver}-1/${_name}-archive-debian-${pkgver}-1.tar.gz)
sha512sums=('3d05cbb58f88a995595c13cdc195474911eef28638dde40958e759d1706846c56abb87b337e74ffa66fc2716a7250f7f0a6bd2815c2f65157eeb4aa12fe86cb6')

package() {
	install -Dm 644 ${_name}-archive-debian-${pkgver}-1/debian/crc32.1 "${pkgdir}"/usr/share/man/man1/crc32.1
}

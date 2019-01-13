# Original maintainer: Alif <alive4ever at live dot com>
# Maintainer: wallace < str(11) + my_id at gmail dot com>

pkgname=perl-archive-zip-crc32
pkgdesc="Provides a Debian manpage for crc32 command line from perl-archive-zip"
pkgver=1.64
pkgrel=1
arch=("any")
url="https://packages.debian.org/sid/libarchive-zip-perl"
license=('GPL' 'PerlArtistic')
depends=("perl-archive-zip")
source=("http://sourcearchive.raspbian.org/main/liba/libarchive-zip-perl/libarchive-zip-perl_${pkgver}-${pkgrel}.debian.tar.xz")
sha512sums=('590ecace757b006ce054a2641ca9f08cd3704b6d0c20d15ddf2eb8ae1f109c7350936f9ffa8b81f8da52288b765d8a9088eeaecdff69970ce54b9ead7f2fa751')

package() {
	install -Dm 644 $srcdir/debian/crc32.1 $pkgdir/usr/share/man/man1/crc32.1
}

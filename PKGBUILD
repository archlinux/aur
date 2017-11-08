# Maintainer: Tom Kuther <tom@kuther.net>
pkgname=cryptonark
_pkgname=cnark
pkgver=0.5.7
pkgrel=1
pkgdesc="SSL security checker"
arch=('i686' 'x86_64')
url="http://blog.techstacks.com/cryptonark.html"
license=('GPL')
groups=()
depends=('perl-io-socket-ssl'
         'perl-tie-hash-indexed'
         'perl-modern-perl'
	 'perl-mozilla-ca')
source=("http://www.techstacks.com/files/${_pkgname}-v${pkgver}.zip")
sha256sums=('373c08b70d3f47362e61540196c6703ad11ef590ccaaa2679acfb7c687f1a008')

package() {
	cd "$srcdir"
	install -Dm755 cnark.pl "${pkgdir}/usr/bin/cnark"
}

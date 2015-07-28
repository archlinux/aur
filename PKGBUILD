# Maintainer: Tom Kuther <tom@kuther.net>
pkgname=cryptonark
_pkgname=cnark
pkgver=0.5.6
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
source=("http://www.techstacks.com/files/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('b01039aa674f23e79600b6cca46ea9dd31d180d5547ef36d0f9c2d8e6c18e312')

package() {
	cd "$srcdir"
	install -Dm755 cnark.pl "${pkgdir}/usr/bin/cnark"
}

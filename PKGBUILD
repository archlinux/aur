# Maintainer: Pierre Sauvage 
pkgname=foundationdb-clients-bin
pkgver=5.1.7
pkgrel=1
pkgdesc="FoundationDB clients and library. FoundationDB is a scalable, fault-tolerant, ordered key-value store with full ACID transactions. This package contains client utilities and libraries."
arch=('x86_64')
url="https://www.foundationdb.org"
license=('Apache 2.0')
groups=('')
depends=('')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://www.foundationdb.org/downloads/${pkgver}/ubuntu/installers/foundationdb-clients_${pkgver}-${pkgrel}_amd64.deb")
sha512sums_x86_64=('dcd76994a4ca5be2b31e65743e3590af62d33357aa4a52ee3d9047ff038bb90ddcd48cf90438fb7b156dbf35f1f246b57c5d9c27855ebcbfd1877bf3eea8f4ec')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

}

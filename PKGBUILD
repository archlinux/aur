pkgname=foundationdb-server-bin
pkgver=6.2.11
pkgrel=1
pkgdesc="FoundationDB server. FoundationDB is a scalable, fault-tolerant, ordered key-value store with full ACID transactions. This package contains the server."
arch=('x86_64')
url="https://www.foundationdb.org"
license=('Apache 2.0')
groups=('foundationdb')
depends=('glibc>=2', 'coreutils>=8', 'tar>=1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://www.foundationdb.org/downloads/${pkgver}/ubuntu/installers/foundationdb-server_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_x86_64=('523c15381cd0025047d3fd74fc2152abca3c5fe71585b375db1ae33a9ef96a00')

package(){

	# Extract package data
	tar xf data.tar.gz -C "${pkgdir}"

}

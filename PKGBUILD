# Maintainer: Brian Smith
pkgname=foundationdb-clients-bin
pkgver=6.2.10
pkgrel=1
pkgdesc="FoundationDB clients and library. FoundationDB is a scalable, fault-tolerant, ordered key-value store with full ACID transactions. This package contains client utilities and libraries."
arch=('x86_64')
url="https://www.foundationdb.org"
license=('Apache 2.0')
groups=('foundationdb')
depends=('glibc>=2', 'coreutils>=8', 'tar>=1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://www.foundationdb.org/downloads/${pkgver}/ubuntu/installers/foundationdb-clients_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_x86_64=('498bd892d7d7997d0844045df8cbedf2eedc64ff6a116eceb8cd3ea50a658886')

package(){

	# Extract package data
	tar xf data.tar.gz -C "${pkgdir}"

}

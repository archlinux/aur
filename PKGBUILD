# Maintainer: Brian Smith
pkgname=foundationdb-clients-bin
pkgver=6.2.19
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
sha256sums_x86_64=('7635ef697ef3d1b7d7f107f2411f98252a89dc341d821ce21aa38f647a225768')

package(){

	# Extract package data
	tar xf data.tar.gz -C "${pkgdir}"

}

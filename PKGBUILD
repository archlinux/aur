# Maintainer: Brian Smith
pkgname=foundationdb-clients-bin
pkgver=7.3.27
pkgrel=1
pkgdesc="FoundationDB clients and library. FoundationDB is a scalable, fault-tolerant, ordered key-value store with full ACID transactions. This package contains client utilities and libraries."
arch=('x86_64')
url="https://www.foundationdb.org"
license=('Apache 2.0')
groups=('foundationdb')
depends=('glibc>=2', 'coreutils>=8', 'tar>=1')
options=('!strip' '!emptydirs')
install=${pkgname}.install
# Remove DLAGENTS once apple can fix their stuff https://bbs.archlinux.org/viewtopic.php?id=262737
DLAGENTS=("https::/usr/bin/curl -Lk -o %o %u")
source_x86_64=("https://github.com/apple/foundationdb/releases/download/${pkgver}/foundationdb-clients_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_x86_64=('96c5f453ff244300760f8a431d8e3ba3b39afdac5becb6d15cff04ac3d0663b0')

package(){

	# Extract package data
	tar xf data.tar.gz -C "${pkgdir}"

}

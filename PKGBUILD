pkgname=foundationdb-server-bin
pkgver=5.1.7
pkgrel=1
pkgdesc="FoundationDB server. FoundationDB is a scalable, fault-tolerant, ordered key-value store with full ACID transactions. This package contains the server."
arch=('x86_64')
url="https://www.foundationdb.org"
license=('Apache 2.0')
groups=('')
depends=('')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://www.foundationdb.org/downloads/${pkgver}/ubuntu/installers/foundationdb-server_${pkgver}-${pkgrel}_amd64.deb")
sha512sums_x86_64=('dc2203342fea472b3801fb3e82096eb000e48e6610fe6f14ba723cda0d6c2c1a21561b2125b837a5e72bb12770519fb39e6b38533d9d267803727da85bf2d147')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

}

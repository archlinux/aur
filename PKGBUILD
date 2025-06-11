# Maintainer: Youn Mélois <youn@melois.dev>
pkgname=fdbcli-bin
pkgver=7.3.63
pkgrel=1
pkgdesc='FoundationDB is a scalable, fault-tolerant, ordered key-value store with full ACID transactions.'
arch=('x86_64')
url='https://www.foundationdb.org/'
license=('Apache-2.0')
groups=('foundationdb')
provides=(
    "fdbcli=${pkgver}"
)
conflicts=('foundationdb-clients-bin')
options=('!debug')
source_x86_64=("https://github.com/apple/foundationdb/releases/download/${pkgver}/fdbcli.x86_64")
sha256sums_x86_64=('b9080a774847c0648e7f4e030cf5e3f309a170c1ab83de463b7b08493ed3ee57')

package() {
    install -Dm755 "${srcdir}/fdbcli.x86_64" "${pkgdir}/usr/bin/fdbcli"
}

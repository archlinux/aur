# Maintainer: Youn Mélois <youn@melois.dev>
pkgname=fdbserver-bin
pkgver=7.3.63
pkgrel=1
pkgdesc='FoundationDB is a scalable, fault-tolerant, ordered key-value store with full ACID transactions.'
arch=('x86_64')
url='https://www.foundationdb.org/'
license=('Apache-2.0')
groups=('foundationdb')
conflicts=('foundationdb-server-bin')
provides=("fdbserver=${pkgver}")
options=('!debug')
source_x86_64=("https://github.com/apple/foundationdb/releases/download/${pkgver}/fdbserver.x86_64")
sha256sums_x86_64=('4b10b947e4576e0bdbac35b11c049de382c541aecd1efbdce39c69a525b74400')

package() {
    install -Dm755 "${srcdir}/fdbserver.x86_64" "${pkgdir}/usr/bin/fdbserver"
}

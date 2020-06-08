# Maintainer: Frank Denis <github@pureftpd.org>

pkgname=encrypted-dns
pkgver=0.3.17
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc="A modern encrypted DNS server (DNSCrypt v2, Anonymized DNSCrypt, DoH)"
url="https://github.com/jedisct1/encrypted-dns-server"
license=('MIT')

build() {
    return 0
}

package() {
    cd $srcdir
    cargo install --root="$pkgdir" --git=https://github.com/jedisct1/encrypted-dns-server
    rm $pkgdir/.crates.toml
    rm $pkgdir/.crates2.json
}

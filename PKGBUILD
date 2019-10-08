# Maintainer: WhizSid <whizsid@aol.com>
pkgname=osm-to-sql
pkgver=0.1.0
pkgrel=1
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="A tool to convert open street map XML data to SQL files."
url="https://github.com/whizsid/osm-to-sql"
license=('MIT')

build() {
    cargo build --release --locked
}

package() {
    install -Dm 755 "$srcdir/../target/release/${pkgname}" -t "${pkgdir}/usr/bin"
}

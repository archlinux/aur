# Maintainer: Cleboost <clement.balarot@gmail.com>
pkgname=codegraph-rs-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Local-first code intelligence: tree-sitter knowledge graph + MCP server (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/Cleboost/codegraph-rs"
license=('MIT')
provides=('codegraph')
conflicts=('codegraph' 'codegraph-bin')
options=(!strip !debug)

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/codegraph-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/codegraph-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('261bfbe80823af6e215c445635f13b37e02d4502d68d9204600618867686acab')
sha256sums_aarch64=('84df78bb0797dfb16fbf357477d9f2012f4d8bea2ce00bfa08b707f5f0e78433')

package() {
    install -Dm755 "$srcdir/codegraph" "$pkgdir/usr/bin/codegraph"
}

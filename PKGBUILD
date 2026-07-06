# Maintainer: Cleboost <clement.balarot@gmail.com>
pkgname=codegraph-rs-bin
pkgver=1.2.0
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

sha256sums_x86_64=('67aadb46dd0f4a971b5b62c7168a4647bc814ad029bd424b3beaf9fd4b8f2580')
sha256sums_aarch64=('ece5ff1b32c243832a3e694732dae88e604a621d6166a6e9e52f130fbdd79e19')

package() {
    install -Dm755 "$srcdir/codegraph" "$pkgdir/usr/bin/codegraph"
}

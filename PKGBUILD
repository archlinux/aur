# Maintainer: Fantix King <fantix.king@gmail.com>
pkgname=edgedb-cli-bin
pkgver=3.4.0
pkgrel=1
pkgdesc="The edgedb command-line interface (CLI) provides an idiomatic way to install EdgeDB, spin up local instances, open a REPL, execute queries, manage auth roles, introspect schema, create migrations, and more."
arch=('x86_64')
url="https://github.com/edgedb/edgedb-cli"
license=('Apache')
_ver_hash='160d07d'
source=("https://packages.edgedb.com/archive/${arch}-unknown-linux-musl/edgedb-cli-${pkgver}+${_ver_hash}.zst")
sha256sums=('5e695894ee72e6c9d8d32393c58139072048692d05fbc5fb4286f8689009ed0a')

package() {
	install -D ${srcdir}/edgedb-cli-${pkgver}+${_ver_hash} "${pkgdir}/usr/bin/edgedb"
}

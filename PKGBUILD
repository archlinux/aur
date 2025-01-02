# Maintainer: Fantix King <fantix.king@gmail.com>
pkgname=edgedb-cli-bin
pkgver=6.1.0
pkgrel=1
pkgdesc="The edgedb command-line interface (CLI) provides an idiomatic way to install EdgeDB, spin up local instances, open a REPL, execute queries, manage auth roles, introspect schema, create migrations, and more."
arch=('x86_64')
url="https://github.com/edgedb/edgedb-cli"
license=('Apache')
_ver_hash='f12dad3'
source=("https://packages.edgedb.com/archive/${arch}-unknown-linux-musl/edgedb-cli-${pkgver}+${_ver_hash}.zst")
sha256sums=('f8e8e2260c0d2d7c38e9a3ca7083078acbd2782b02c8f628c503aaffce154092')

package() {
	install -D ${srcdir}/edgedb-cli-${pkgver}+${_ver_hash} "${pkgdir}/usr/bin/edgedb"
}

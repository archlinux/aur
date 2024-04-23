# Maintainer: Fantix King <fantix.king@gmail.com>
pkgname=edgedb-cli-bin
pkgver=5.0.0
pkgrel=1
pkgdesc="The edgedb command-line interface (CLI) provides an idiomatic way to install EdgeDB, spin up local instances, open a REPL, execute queries, manage auth roles, introspect schema, create migrations, and more."
arch=('x86_64')
url="https://github.com/edgedb/edgedb-cli"
license=('Apache')
_ver_hash='c9dfeec'
source=("https://packages.edgedb.com/archive/${arch}-unknown-linux-musl/edgedb-cli-${pkgver}+${_ver_hash}.zst")
sha256sums=('7848fdb0d3e3961063e9783e74bb7b51d03e9cd0c7a78d5385952b236ba93b89')

package() {
	install -D ${srcdir}/edgedb-cli-${pkgver}+${_ver_hash} "${pkgdir}/usr/bin/edgedb"
}

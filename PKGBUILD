# Maintainer: Fantix King <fantix.king@gmail.com>
pkgname=edgedb-cli-bin
pkgver=4.1.0
pkgrel=1
pkgdesc="The edgedb command-line interface (CLI) provides an idiomatic way to install EdgeDB, spin up local instances, open a REPL, execute queries, manage auth roles, introspect schema, create migrations, and more."
arch=('x86_64')
url="https://github.com/edgedb/edgedb-cli"
license=('Apache')
_ver_hash='03ae624'
source=("https://packages.edgedb.com/archive/${arch}-unknown-linux-musl/edgedb-cli-${pkgver}+${_ver_hash}.zst")
sha256sums=('b005daf5832e51514153f27a224d438e22812d498a18884ff5edc712f048b81c')

package() {
	install -D ${srcdir}/edgedb-cli-${pkgver}+${_ver_hash} "${pkgdir}/usr/bin/edgedb"
}

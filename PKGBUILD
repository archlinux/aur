# Maintainer: Fantix King <fantix.king@gmail.com>
pkgname=edgedb-cli-bin
pkgver=5.2.3
pkgrel=1
pkgdesc="The edgedb command-line interface (CLI) provides an idiomatic way to install EdgeDB, spin up local instances, open a REPL, execute queries, manage auth roles, introspect schema, create migrations, and more."
arch=('x86_64')
url="https://github.com/edgedb/edgedb-cli"
license=('Apache')
_ver_hash='4559649'
source=("https://packages.edgedb.com/archive/${arch}-unknown-linux-musl/edgedb-cli-${pkgver}+${_ver_hash}.zst")
sha256sums=('03b4b7acb75eb806f24c808215266bf0bf6706169d91f7f5f25988095d84064d')

package() {
	install -D ${srcdir}/edgedb-cli-${pkgver}+${_ver_hash} "${pkgdir}/usr/bin/edgedb"
}

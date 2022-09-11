# Maintainer: Dominik Schwaiger <mail@dominik-schwaiger.ch>
pkgname=surrealdb-bin
pkgver=1.0.0_beta.7
pkgrel=1
epoch=
pkgdesc="A scalable, distributed, collaborative, document-graph database, for the realtime web"
arch=('x86_64')
url="https://github.com/surrealdb/surrealdb"
license=('custom:BSL' 'MIT' 'Apache')
groups=()
depends=('curl')
makedepends=()
checkdepends=()
optdepends=()
provides=('surrealdb')
conflicts=('surrealdb')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/surrealdb/surrealdb/releases/download/v${pkgver//_/-}/LICENSE" "https://github.com/surrealdb/surrealdb/releases/download/v${pkgver//_/-}/surreal-v${pkgver//_/-}.linux-amd64.tgz")
noextract=()
sha256sums=('3012620080caa47eb9d8fd490044274b9b71eda7fc48c9084914a5470800a868' '0cf3f72bb195746b451ed68a82ee256c1f20e5c9f1379a0dba01286eca9dd13c')
validpgpkeys=()

package() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm755 surreal "$pkgdir/usr/bin/surreal"
}

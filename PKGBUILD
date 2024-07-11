# Maintainer: Dominik Schwaiger <mail@dominik-schwaiger.ch>
pkgname=surrealdb-bin
pkgver=1.5.4
pkgrel=1
epoch=
pkgdesc="A scalable, distributed, collaborative, document-graph database, for the realtime web"
arch=('x86_64')
url="https://github.com/surrealdb/surrealdb"
license=('custom:BSL')
groups=()
depends=('gcc-libs')
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
sha256sums=('a007c53f27d30bda8cc56feec356eba13b646a8fb59a97d151e3aab820429d2d' '901dbf5277329304eb9a8e769ae0d69d0d7a3c0538bca4f90b3c834e4eb6f5fc')
validpgpkeys=()

package() {
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm755 surreal "$pkgdir/usr/bin/surreal"
}

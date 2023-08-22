# Maintainer: Mattias Cockburn <mattias.cockburn@iits-consulting.de>
pkgname=otc-auth
pkgver=v2.0.1
pkgrel=1
epoch=
pkgdesc="Open Source CLI for the Authorization with the Open Telekom Cloud"
arch=(x86_64 arm64)
url="https://github.com/iits-consulting/otc-auth"
license=('GPL3')
groups=()
depends=()
makedepends=(go)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/iits-consulting/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
  go build -v -o otc-auth .
}

package() {
	cd "$pkgname-$pkgver"
	install -d -m 0755 "${pkgdir}/usr/bin"
  install -m 0755 otc-auth "${pkgdir}/usr/bin"
}

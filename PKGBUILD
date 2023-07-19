# Maintainer: Mattias Cockburn <mattias.cockburn@iits-consulting.de>
pkgname=policy-reporter-cli
pkgver=0.5.0
_pkgver=v${pkgver}
pkgrel=1
epoch=
pkgdesc="Open Source CLI for the Authorization with the Open Telekom Cloud"
arch=(x86_64 arm64)
url="https://github.com/fjogeleit/policy-reporter-cli"
license=('MIT')
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
source=("https://github.com/fjogeleit/${pkgname}/archive/refs/tags/${_pkgver}.tar.gz")
noextract=()
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
  go build -v -o policy-reporter-cli .
}

package() {
	cd "$pkgname-$pkgver"
	install -d -m 0755 "${pkgdir}/usr/bin"
  install -m 0755 policy-reporter-cli "${pkgdir}/usr/bin"
}
sha256sums=('0747829b265ff33aff482f5962dd316a86c5b1fa95fa437cc5dced632c65c59f')

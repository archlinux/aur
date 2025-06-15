# Maintainer: Vincent B. <vb@luminar.eu.org>
pkgname=restate-cli
pkgver=1.3.2
pkgrel=1
epoch=
pkgdesc="Building resilient applications made easy! (CLI)"
arch=('x86_64' 'aarch64')
url="https://github.com/restatedev/restate"
license=('BUSL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=("https://restate.gateway.scarf.sh/v${pkgver}/restate-cli-x86_64-unknown-linux-musl.tar.xz")
source_aarch64=("https://restate.gateway.scarf.sh/v${pkgver}/restate-cli-aarch64-unknown-linux-musl.tar.xz")
sha256sums_x86_64=('d3e24515a3ac20af66450cc09550d13e9870e14e29f8362ef25dfed63561100b')
sha256sums_aarch64=('8ee2cbe1165ea18c6ad6f40e2691c2765ed2f46880c285770f102d5e766f3c37')
noextract=()

package() {
  cd "$srcdir/restate-cli-${CARCH}-unknown-linux-musl"

  install -Dm755 restate "$pkgdir/usr/bin/restate"
}

# vim:set ts=2 sw=2 et:

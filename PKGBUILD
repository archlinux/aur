# Maintainer: Vincent B. <vb@luminar.eu.org>
pkgname=restate-cli
pkgver=1.5.6
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
sha256sums_x86_64=('a1d4d60d293428fc4649e1b6fcbf320e83591b26828c2d7e68e06af148d4500a')
sha256sums_aarch64=('f5b1f9fe9f74834b7583299207f4be7ce081dab04a2e4cdf2194af2a6229a47f')
noextract=()

package() {
  cd "$srcdir/restate-cli-${CARCH}-unknown-linux-musl"

  install -Dm755 restate "$pkgdir/usr/bin/restate"
}

# vim:set ts=2 sw=2 et:

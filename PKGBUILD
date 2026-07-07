# Maintainer: Vincent B. <vb@luminar.eu.org>
pkgname=restate-cli
pkgver=1.7.2
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
sha256sums_x86_64=('b659a82acecbd624736b54aeeb8a3a53623d3bd93c8510e93ef9eb09268903ab')
sha256sums_aarch64=('9abf2406f5f2271517ed4f2008355531774ef377fb9127a3bf8277479d3e7048')
noextract=()

package() {
  cd "$srcdir/restate-cli-${CARCH}-unknown-linux-musl"

  install -Dm755 restate "$pkgdir/usr/bin/restate"
}

# vim:set ts=2 sw=2 et:

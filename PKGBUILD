# Maintainer: Vincent B. <vb@luminar.eu.org>
pkgname=restate-cli
pkgver=1.5.5
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
sha256sums_x86_64=('6f24c3b9275b0e9e7c6f4bdaab414e2e82aacd4a60c6118123c4259da23c5f89')
sha256sums_aarch64=('0f3171e71c92792371599b5992f1e466c67f232172b30dd03e370a83b7571b3e')
noextract=()

package() {
  cd "$srcdir/restate-cli-${CARCH}-unknown-linux-musl"

  install -Dm755 restate "$pkgdir/usr/bin/restate"
}

# vim:set ts=2 sw=2 et:

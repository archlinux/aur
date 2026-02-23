# Maintainer: Vincent B. <vb@luminar.eu.org>
pkgname=restate-cli
pkgver=1.6.2
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
sha256sums_x86_64=('d671bf2434b410ddf03cf73f73914ccecedd60bfc3d66e841a3d7f9258139e54')
sha256sums_aarch64=('16ad6a2964c398553ae8da910f76d36b3be8ad9a8ac301963918f06f8ad1869d')
noextract=()

package() {
  cd "$srcdir/restate-cli-${CARCH}-unknown-linux-musl"

  install -Dm755 restate "$pkgdir/usr/bin/restate"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.95
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.95-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.95-x86_64")
sha512sums=('53ca97f1abb565bc2db9ddb675be8a85e93cc82819b223d1866c10c167f9054a45f1e2b3ee2453741c0907057bf0b0f097df6deae024b6b284de813ec17f44f4')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.95-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

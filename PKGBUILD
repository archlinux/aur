# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.113
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.113-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.113-x86_64")
sha512sums=('eea27299d80579503eaa7411f995030f4fbad21fa4b568389cb4c455a964d88da3a1ddfe08efd7350a0f56010f6f2215c3585f54d5b5043c9e18ef4857e39fa3')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.113-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

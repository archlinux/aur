# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.117
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.117-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.117-x86_64")
sha512sums=('1c8d83492134e7c3b694599b76fc30f84e2649715ea318d9e47294e136a5d1680418d0b9f1392bd26a2b72abbb70ac87b1bd4e23b619815a68f1f63cd6fca17a')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.117-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

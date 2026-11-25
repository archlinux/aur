# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.124
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.124-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.124-x86_64")
sha512sums=('2d32416526b455448e03c5b663c1a2394084474cab2584b7b803e7eadfeaf458d576dedab3450d4b2a268b84ec71902fa8ae91b5ab8dd4a347fe78b9e12e4710')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.124-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

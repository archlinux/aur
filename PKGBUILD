# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.68
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.68-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.68-x86_64")
sha512sums=('434ba8d0d633c0f24109aa103b474787d8a98da20615baad47ae630ebe703f001dcb5c8d60eae67e971a6fb43cf3f838511993dc2b24a4b0d479470f5a8e1fc9')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.68-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

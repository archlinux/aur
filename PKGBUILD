# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.107
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.107-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.107-x86_64")
sha512sums=('fed33afbdf84768b758a3d6265e9e0aace04c8ecab95f14d9a0ef6d7c62a0882c22055fa82c378d005b5844a2dd67f052b81177441ec36cc952ee5b142c4fed7')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.107-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

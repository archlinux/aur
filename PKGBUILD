# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.103
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.103-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.103-x86_64")
sha512sums=('10e478bae08cbe139237c5eafec58f03d07ec33eccccee6c40c0cb4e463fe47bfac22f7625003edd574bdd1ce03ed29467d79ff797d79ce31a1c2db0dd510805')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.103-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

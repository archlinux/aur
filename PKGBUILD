# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.121
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.121-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.121-x86_64")
sha512sums=('3c11bac11985a34562adc374e8327a88fad5960fbbb5176945ac3af013306d109d641d8090aa7648d7d1d2528349822a904630024befb0fc6a3baf7ef3ca733f')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.121-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

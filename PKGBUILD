# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.75
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.75-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.75-x86_64")
sha512sums=('b7a8738f2474eeef66d5a9bd55600b852be9d9092fbf53cef58b14f202df177116fe9ad815cc4ebf08a8bcd9593e1b7678594bbe0c140ad6479d43ce03db92d7')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.75-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

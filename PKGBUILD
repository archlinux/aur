# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.67
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.67-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.67-x86_64")
sha512sums=('70b45ebb605adda8c7356ff849648704bf11dff9248515730b7b0d77dd7a2ce8fb722097687e3d777073b0ee1c1d1e26ddda6dfc052de343528c89476286c767')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.67-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

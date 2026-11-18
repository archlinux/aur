# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.123
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.123-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.123-x86_64")
sha512sums=('41ab9cf84e2c5ffd6e4fe2374b0a76004eba678d665e03d16eafb339b579d192e4d51705c794dc9a8572f35455d19831ba41d49ca1c7afc9ba74ce0c41db3c8c')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.123-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.97
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.97-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.97-x86_64")
sha512sums=('c3c9860f4efdcec38a0067e9b083a99de59cd02cc80bb9e9e3bd5480a6f40f25eb57fb44c781a3214780f99a95f8325224f48596a9de2db8b6ea71ae0974812d')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.97-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

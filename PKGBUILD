# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.83
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.83-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.83-x86_64")
sha512sums=('fc0af5851a8b0955ae6690c49cbdba1c8b3dfaea66f60de8b2123d3a6d7158860908c33b339235de2d2120e66a4aa231d3a51f599c303e3b4eeb50170e05bb22')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.83-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

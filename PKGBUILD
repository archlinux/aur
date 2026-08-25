# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.94
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.94-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.94-x86_64")
sha512sums=('ba432021c49c09d6f02848d68790b12a1b34e027fea7f67fa34463eb08789c7dea4c30159781fff3d7f3bfa579717bdf8a9965961deecd5b7a335bd96f1013d8')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.94-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

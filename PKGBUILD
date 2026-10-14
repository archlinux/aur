# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.114
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.114-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.114-x86_64")
sha512sums=('6310c04c9f7177c4af23162741187ac3db683cc03536f80a43745e040fecd9f776aa4e955f9888e5bd8d8688f73435f2084ed8f6e0769351fab39c91c4a3c1aa')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.114-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

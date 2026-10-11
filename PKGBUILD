# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.110
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.110-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.110-x86_64")
sha512sums=('2af6fd6f5bfa3e4b84b6601ac838ec18e60a4dbd9696fad10f52a507b9e80a2f46a1f4a08b7bcbbb5a8d900c92252fde0db5e0baf6bb5cba94810531ac2147c2')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.110-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

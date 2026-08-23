# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.92
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.92-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.92-x86_64")
sha512sums=('2bbe378fe3c98186e16ee93a5d92baee347161034dedd221910d466a0f3b6f8e1aaf370ab5d35cd702df5971e62bb84ab498c62a04243896bb76d3cf6f3e1be2')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.92-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

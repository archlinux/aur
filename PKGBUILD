# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.105
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.105-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.105-x86_64")
sha512sums=('e68adb410bc3f3db5c3fbdbcbde38bff7107935bee0755a039571c0b0cc108f79232e3d5e5968a84aad1ca4312c3ad0c18c453a4e8d26e87c1b76bf168b837ad')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.105-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

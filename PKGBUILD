# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.106
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.106-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.106-x86_64")
sha512sums=('f9865335498ef2c651fa4ad37a220c988285b64436258591979333bb15f5b9f688bfe76cd968bdd41a468ceac509d26befa2b2645855573675792e32b5379ead')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.106-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

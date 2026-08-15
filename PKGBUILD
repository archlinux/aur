# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.84
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.84-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.84-x86_64")
sha512sums=('5a21d8e6f0196f5dc44c19e65f1c43b01844c95c146df2de493c97ca13b538c8e316ca1473bef9584fc635111c545520b3855f61dfb81a6181ba3592dbf1c3ef')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.84-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

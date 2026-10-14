# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.112
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.112-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.112-x86_64")
sha512sums=('0d8bd716af6270e1bb2676acedc540559790f9d5c24db436c7a6cda86ff7a4d7d2f1a9e331d3df4d86332d46600bda226de00e729d551a4a743a2b90d78123c5')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.112-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

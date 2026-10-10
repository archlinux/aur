# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.108
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.108-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.108-x86_64")
sha512sums=('a54c49469729903a1a0da92d4f10e492cde5d3dd34f3eaa510a32ac2a2755b801621ca14781e0620eff9f296bffb9ea539ded9c31fea555146a8b8ce136261c0')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.108-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

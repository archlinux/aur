# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.115
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.115-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.115-x86_64")
sha512sums=('1c1292400b29be462a4b9b16f1a2f027bf47fceadade9eff5a74b15957acb9a5e71f3d57049f70b5a12c0fb1aad64a6ae7162978d6b1adfd4b47a857978b4af0')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.115-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

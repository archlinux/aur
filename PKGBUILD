# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.82
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.82-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.82-x86_64")
sha512sums=('7f3855f0ffd3e58ee0c5d90b977639ea1efd3a08647c60e595366cf22b2f0e89a8eaa6d7c37a90e5bbf3276cd70d32462894be64e3d730c488664f460f28cb64')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.82-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

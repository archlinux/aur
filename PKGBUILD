# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.88
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.88-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.88-x86_64")
sha512sums=('03037db6d7923017dd1f94393c5c1077b7f6fb03cdd6719a7c5cd6237bda133826dd109a0560c8fb06953650b633bdd5a730f0567502bacb31685878e4a1b1a3')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.88-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

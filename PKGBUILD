# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.109
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.109-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.109-x86_64")
sha512sums=('0233789888d2176b7a8eacb4a8c2321b904b539fc391e56315cf7eb584f8a3d9a31d90776a7cdcb765900fde67f445342889924624018c09717ccb414637f6c5')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.109-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

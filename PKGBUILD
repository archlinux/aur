# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.119
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.119-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.119-x86_64")
sha512sums=('70eb0d2b80f637f75eb4574f43ec347c33ec569fe48a656646fe06e0d19bf823c78a1cb14a9cb8d7d3c0b273c693ac362f1a910a17a5f960cac778831c7469ba')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.119-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

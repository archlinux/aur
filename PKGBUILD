# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.101
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.101-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.101-x86_64")
sha512sums=('671c9aaa90f3dc29a65e6e6d435829f512f03bec35182dd25c08aa29000806c7b62c58d555ccf912c4bf46a35357983bf0370cbd05c8ebbe5aaa6abed682f0e5')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.101-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

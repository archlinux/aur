# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.116
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.116-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.116-x86_64")
sha512sums=('666a9f1af58ba4d2aab1720280ff07122f5ef00d5fd2814e5233468687555d971c7c221b32957259d03796ec11c7768f7b574713479ad9b51da53fc8a4907b9c')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.116-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

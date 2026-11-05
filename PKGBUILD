# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.120
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.120-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.120-x86_64")
sha512sums=('838d7eae15a176270c3d9f24a3e47011189ebc52197388baec861bb81f1fd0cc1e331d6bbfa5a64d0fef1431c2c03b0e0cc5ccc2d98319d2b23f0b92e3a8da93')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.120-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

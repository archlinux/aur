# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.96
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.96-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.96-x86_64")
sha512sums=('8cce88f3db1f275b86d9d305115bdcd72970dbd3e8f3084c81fcb5adb24a372120a0568620760aa9441f217e2b35fa3fa6d386f0cd0261c0fd3f4b48974bad70')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.96-x86_64" "$pkgdir/usr/bin/agentics-companion"
}

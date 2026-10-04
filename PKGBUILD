# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.102
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.102-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.102-x86_64")
sha512sums=('adcd3648bb7816d06cd609084c2edd2e25828934a366cd15bd0e1c9456785f617c055aa2f3fc1692e3e3bba93616661df1b153295b3d644151d24cfbeb0485b3')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.102-x86_64" "$pkgdir/usr/bin/agentics-companion"
}
